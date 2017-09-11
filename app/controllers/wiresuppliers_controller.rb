class WiresuppliersController < ApplicationController
  def index
    @wiresuppliers = Wiresupplier.all
  end

  # Control logic for create-view
  # GET /wiresuppliers/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @wiresupplier = Wiresupplier.new
    @wires = Wire.all
    @wiresupplier.wires = @wires
  end

  # Control logic when creating a new wiresupplier
  # POST /wiresuppliers
  def create
    @wiresupplier = Wiresupplier.new(wiresupplier_params)
    @wires = Wire.all
    @wiresupplier.wires = @wires
    # write wiresupplier to database
    if @wiresupplier.save

      redirect_to wiresuppliers_path, :notice => 'Kabellieferant erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /wiresuppliers/:id
  def show
    @wiresupplier = Wiresupplier.find(params[:id])
  end

  # Control logic for edit-view
  # GET /wiresuppliers/:id/edit
  def edit
    @wiresupplier = Wiresupplier.find(params[:id])
  end

  # Save an updated wiresupplier
  # PUT /wiresuppliers/:id
  def update
    @wiresupplier = Wiresupplier.find(params[:id])
    if @wiresupplier.update(wiresupplier_params)
      redirect_to wiresuppliers_path, :notice => 'Kabellieferant erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a wiresupplier
  # DELETE /wiresuppliers/:id
  def destroy
    @wiresupplier = Wiresupplier.find(params[:id])
    @wiresupplier.destroy
    redirect_to wiresuppliers_path, :notice => 'Kabellieferant wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new wiresupplier
  def wiresupplier_params
    params.require(:wiresupplier).permit(:name, {:wire_ids => []})
  end
end
