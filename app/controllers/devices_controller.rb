class DevicesController < ApplicationController
  
  def index
    @devices = Device.all
  end

  # Control logic for create-view
  # GET /devices/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @device = Device.new
  end

  # Control logic when creating a new device
  # POST /devices
  def create
    @device = Device.new(device_params)
    # write device to database
    if @device.save
      redirect_to devices_path, :notice => 'Gerät erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /devices/:id
  def show
    @device = Device.find(params[:id])
  end

  # Control logic for edit-view
  # GET /devices/:id/edit
  def edit
    @device = Device.find(params[:id])
  end

  # Save an updated device
  # This method is either called from the device edit-view (GET /devices/:id/edit)
  # or the device filter-view (GET /devices/:id/filter)
  # PUT /devices/:id
  def update
    @device = Device.find(params[:id])
    if @device.update(device_params)
      redirect_to devices_path, :notice => 'Gerät erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a device
  # DELETE /devices/:id
  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path, :notice => 'Gerät wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new device
  def device_params
    params.require(:device).permit!
  end

end
