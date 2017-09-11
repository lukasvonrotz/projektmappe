class WiresController < ApplicationController
  def index
    @wires = Wire.all
    @wiresuppliers = Wiresupplier.all

    @allPricesEntered = 0
    @wires.each do |wire|
      @wiresuppliers.each do |wiresupplier|
        begin
          testnumber = WireWiresupplier.where(["wire_id = ? and wiresupplier_id = ?", wire.id, wiresupplier.id]).first.beschriftungkabeleinanschluss
          if testnumber.nil?
            @allPricesEntered = WireWiresupplier.where(["wire_id = ? and wiresupplier_id = ?", wire.id, wiresupplier.id]).first.wiresupplier_id
          end
        rescue
          @allPricesEntered = wiresupplier.id
        end
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
      @wiresuppliers = Wiresupplier.all
      @wiresuppliers.each do |wiresupplier|
        wireWiresupplierEntry = WireWiresupplier.new
        wireWiresupplierEntry.wire_id = @wire.id
        wireWiresupplierEntry.wiresupplier_id = wiresupplier.id
        wireWiresupplierEntry.save
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

  private
  # defines which parameters have to be provided by the form when creating a new wire
  def wire_params
    params.require(:wire).permit(:aderbeschriftung, :anzahladern, :kabeltyp)
  end
end
