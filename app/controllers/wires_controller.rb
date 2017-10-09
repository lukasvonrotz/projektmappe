class WiresController < ApplicationController
  def index
    @wires = Wire.all
    @wiresuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'})
    @wirecaptionsuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'})

    respond_to do |format|
      format.html
      format.csv { send_data @wires.to_csv, filename: "wires-#{Date.today}.csv" }
    end

    # Check whether all prices of all wire suppliers are provided in database
    @allPricesEntered = 0
    @wires.each do |wire|
      @wiresuppliers.each do |wiresupplier|
        begin
          wiresupplierEntry = WireSupplier.where(["wire_id = ? and supplier_id = ?", wire.id, wiresupplier.id]).first
          anschlusstableauseite = wiresupplierEntry.anschlusstableauseite
          anschlussgeraeteseite = wiresupplierEntry.anschlussgeraeteseite
          beschriftungkabeleinanschluss = wiresupplierEntry.beschriftungkabeleinanschluss
          beschriftungaderneinanschluss = wiresupplierEntry.beschriftungaderneinanschluss
          installationhohlboden = wiresupplierEntry.installationhohlboden
          installationtrasse = wiresupplierEntry.installationtrasse
          installationrohr = wiresupplierEntry.installationrohr

          if anschlusstableauseite.nil? or anschlussgeraeteseite.nil? or beschriftungkabeleinanschluss.nil? or beschriftungaderneinanschluss.nil? or installationhohlboden.nil? or installationtrasse.nil? or installationrohr.nil?
            @allPricesEntered = wiresupplierEntry.wiresupplier_id
          end
        rescue
          @allPricesEntered = wiresupplier.id
        end
      end
    end

    # check wether all caption prices are provided in database
    @captionPricesEntered = 0
    @wirecaptionsuppliers.each do |wirecaptionsupplier|
      begin
        wirecaptionpriceEntry = Wirecaptionprice.where("supplier_id = ?", wirecaptionsupplier.id).first
        kostenkabelmitmontagetraeger = wirecaptionpriceEntry.kostenkabelmitmontagetraeger
        kostenadermitmontagehuelse = wirecaptionpriceEntry.kostenadermitmontagehuelse
        if kostenkabelmitmontagetraeger.nil? or kostenadermitmontagehuelse.nil?
          @captionPricesEntered = wirecaptionpriceEntry.supplier_id
        end
      rescue
        @captionPricesEntered = wirecaptionsupplier.id
      end
    end
  end

  # Control logic for create-view
  # GET /wires/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @wire = Wire.new
  end

  # Control logic when creating a new wire
  # POST /wires
  def create
    @wire = Wire.new(wire_params)
    # write wire to database
    if @wire.save
      @wiresuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'})
      @wiresuppliers.each do |wiresupplier|
        wireWiresupplierEntry = WireSupplier.new
        wireWiresupplierEntry.wire_id = @wire.id
        wireWiresupplierEntry.supplier_id = wiresupplier.id
        wireWiresupplierEntry.save!
      end

      redirect_to wires_path, :notice => 'Kabel erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /wires/:id
  def show
    @wire = Wire.find(params[:id])
    @wiresuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'})
    @wirecaptionsuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'})
  end

  # Control logic for edit-view
  # GET /wires/:id/edit
  def edit
    @wire = Wire.find(params[:id])
  end

  # Save an updated wire
  # PUT /wires/:id
  def update
    @wire = Wire.find(params[:id])
    if @wire.update(wire_params)
      redirect_to wires_path, :notice => 'Kabel erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a wire
  # DELETE /wires/:id
  def destroy
    @wire = Wire.find(params[:id])
    @wire.destroy
    redirect_to wires_path, :notice => 'Kabel wurde gelöscht.'
  end

  def import
    status = Wire.import(params[:file])
    if !status.nil?
      redirect_to wires_path, :notice => status
    else
      redirect_to wires_path, :notice => 'Kabel erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new wire
  def wire_params
    params.require(:wire).permit(:aderbeschriftung, :anzahladern, :kabeltyp)
  end
end
