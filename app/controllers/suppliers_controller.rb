class SuppliersController < ApplicationController
    def index
      @suppliers = Supplier.all
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

      suppliertypeid = Suppliertype.where(name: 'Kabelbeschriftung').first.id
      if supplier_params[:suppliertype_ids].include? suppliertypeid.to_s
        puts 'lukas'
        wirecaptionprice = Wirecaptionprice.create
        wirecaptionprice.supplier = @supplier
        puts wirecaptionprice.errors.first
        wirecaptionprice.save
        puts 'erstellt'
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
      @supplier.destroy
      redirect_to suppliers_path, :notice => 'Lieferant wurde gelöscht.'
    end

    private
    # defines which parameters have to be provided by the form when creating a new supplier
    def supplier_params
      params.require(:supplier).permit(:name, {:suppliertype_ids => []})
    end

end
