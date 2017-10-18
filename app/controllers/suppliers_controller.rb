class SuppliersController < ApplicationController
    def index
      @suppliers = Supplier.all

      respond_to do |format|
        format.html
        format.csv { send_data @suppliers.to_csv, filename: "suppliers-#{Date.today}.csv" }
      end
    end

    # Control logic for create-view
    # GET /suppliers/new
    def new
      # build a 'temporary' post which is written to DB later (create-method)
      @supplier = Supplier.new
    end

    # Control logic when creating a new supplier
    # POST /suppliers
    def create
      @supplier = Supplier.new(supplier_params)

      # Einträge in wire_suppliers für alle Kabel erstellen
      suppliertypeid = Suppliertype.where(name: 'Kabel').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        Wire.all.each do |wire|
          wire_supplier = WireSupplier.create
          wire_supplier.supplier = @supplier
          wire_supplier.wire = wire
          wire_supplier.save!
        end
      end

      suppliertypeid = Suppliertype.where(name: 'Kabelbeschriftung').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        wirecaptionprice = Wirecaptionprice.create
        wirecaptionprice.supplier = @supplier
        wirecaptionprice.save!
      end

      # write supplier to database
      if @supplier.save
        redirect_to suppliers_path, :notice => 'Lieferant erfolgreich erstellt.'
      else
        render 'new'
      end
    end

    # Control logic for show-view
    # GET /suppliers/:id
    def show
      @supplier = Supplier.find(params[:id])
    end

    # Control logic for edit-view
    # GET /suppliers/:id/edit
    def edit
      @supplier = Supplier.find(params[:id])
    end

    # Save an updated supplier
    # PUT /suppliers/:id
    def update
      @supplier = Supplier.find(params[:id])

      # Einträge in wire_suppliers für alle Kabel erstellen
      suppliertypeid = Suppliertype.where(name: 'Kabel').first.id
      if (supplier_params[:suppliertype_ids].include? suppliertypeid.to_s) && !WireSupplier.where(:supplier_id => @supplier.id).any?
        Wire.all.each do |wire|
          wire_supplier = WireSupplier.create
          wire_supplier.supplier = @supplier
          wire_supplier.wire = wire
          wire_supplier.save!
        end
      end
      suppliertypeid = Suppliertype.where(name: 'Kabelbeschriftung').first.id
      if (supplier_params[:suppliertype_ids].include? suppliertypeid.to_s) && !Wirecaptionprice.where(:supplier_id => @supplier.id).any?
        wirecaptionprice = Wirecaptionprice.create
        wirecaptionprice.supplier = @supplier
        wirecaptionprice.save!
      end

      if @supplier.update(supplier_params)
        redirect_to suppliers_path, :notice => 'Lieferant erfolgreich aktualisiert.'
      else
        render 'edit'
      end
    end

    # Delete a supplier
    # DELETE /suppliers/:id
    def destroy
      @supplier = Supplier.find(params[:id])
      if @supplier.wire_subsubprojects.any? || @supplier.wirecaption_subsubprojects.any?
        redirect_to suppliers_path, :alert => 'Lieferant konnte nicht gelöscht werden, da er bereits in Versionen verknüpft ist.'
      else
        @supplier.destroy
        redirect_to suppliers_path, :notice => 'Lieferant wurde gelöscht.'
      end
    end

    def import
      status = Supplier.import(params[:file])
      if !(status == '')
        redirect_to suppliers_path, :alert => status
      else
        redirect_to suppliers_path, :notice => 'Lieferanten-Liste erfolgreich aktualisiert.'
      end
    end

    private
    # defines which parameters have to be provided by the form when creating a new supplier
    def supplier_params
      params.require(:supplier).permit(:name, {:suppliertype_ids => []})
    end

end
