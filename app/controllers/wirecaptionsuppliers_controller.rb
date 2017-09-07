class WirecaptionsuppliersController < ApplicationController
  def index
    @wirecaptionsuppliers = Wirecaptionsupplier.all
  end

  # Control logic for create-view
  # GET /wirecaptionsuppliers/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @wirecaptionsupplier = Wirecaptionsupplier.new
  end

  # Control logic when creating a new wirecaptionsupplier
  # POST /wirecaptionsuppliers
  def create
    @wirecaptionsupplier = Wirecaptionsupplier.new(wirecaptionsupplier_params)
    # write wirecaptionsupplier to database
    if @wirecaptionsupplier.save
      redirect_to wirecaptionsuppliers_path, :notice => 'Kabelbeschriftungslieferant erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /wirecaptionsuppliers/:id
  def show
    @wirecaptionsupplier = Wirecaptionsupplier.find(params[:id])
  end

  # Control logic for edit-view
  # GET /wirecaptionsuppliers/:id/edit
  def edit
    @wirecaptionsupplier = Wirecaptionsupplier.find(params[:id])
  end

  # Save an updated wirecaptionsupplier
  # PUT /wirecaptionsuppliers/:id
  def update
    @wirecaptionsupplier = Wirecaptionsupplier.find(params[:id])
    if @wirecaptionsupplier.update(wirecaptionsupplier_params)
      redirect_to wirecaptionsuppliers_path, :notice => 'Kabelbeschriftungslieferant erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a wirecaptionsupplier
  # DELETE /wirecaptionsuppliers/:id
  def destroy
    @wirecaptionsupplier = Wirecaptionsupplier.find(params[:id])
    @wirecaptionsupplier.destroy
    redirect_to wirecaptionsuppliers_path, :notice => 'Kabelbeschriftungslieferant wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new wirecaptionsupplier
  def wirecaptionsupplier_params
    params.require(:wirecaptionsupplier).permit(:name, :kostenkabelmitmontagetraeger, :kostenadermitmontagehuelse)
  end
end
