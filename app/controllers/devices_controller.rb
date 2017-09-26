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
    device_wires1 = params[:device][:device_wires1]
    device_wires2 = params[:device][:device_wires2]
    device_wires3 = params[:device][:device_wires3]

    puts params[:device][:device_wires1]

    device_electrical_installations1 = params[:device][:device_electrical_installations1]
    device_electrical_installations2 = params[:device][:device_electrical_installations2]
    device_electrical_installations3 = params[:device][:device_electrical_installations3]

    puts params[:device][:device_electrical_installations1]

    params[:device].delete :device_wires1
    params[:device].delete :device_wires2
    params[:device].delete :device_wires3
    params[:device].delete :device_electrical_installations1
    params[:device].delete :device_electrical_installations2
    params[:device].delete :device_electrical_installations3

    @device = Device.new(device_params)

    # write device to database
    if @device.save

      if device_wires1["wire_id"] != ""
        deviceWireEntry = DeviceWire.new
        deviceWireEntry.device = @device
        deviceWireEntry.wire = Wire.find(device_wires1["wire_id"])
        deviceWireEntry.definition = device_wires1["definition"]
        deviceWireEntry.laenge = device_wires1["laenge"]
        deviceWireEntry.save!
      end
      if device_wires2["wire_id"] != ""
        deviceWireEntry = DeviceWire.new
        deviceWireEntry.device = @device
        deviceWireEntry.wire = Wire.find(device_wires2["wire_id"])
        deviceWireEntry.definition = device_wires2["definition"]
        deviceWireEntry.laenge = device_wires2["laenge"]
        deviceWireEntry.save!
      end
      if device_wires3["wire_id"] != ""
        deviceWireEntry = DeviceWire.new
        deviceWireEntry.device = @device
        deviceWireEntry.wire = Wire.find(device_wires3["wire_id"])
        deviceWireEntry.definition = device_wires3["definition"]
        deviceWireEntry.laenge = device_wires3["laenge"]
        deviceWireEntry.save!
      end

      if device_electrical_installations1["electrical_installation_id"] != ""
        deviceElectricalInstallationEntry = DeviceElectricalInstallation.new
        deviceElectricalInstallationEntry.device = @device
        deviceElectricalInstallationEntry.electrical_installation = ElectricalInstallation.find(device_electrical_installations1["electrical_installation_id"])
        deviceElectricalInstallationEntry.definition = device_electrical_installations1["definition"]
        deviceElectricalInstallationEntry.value = device_electrical_installations1["value"]
        deviceElectricalInstallationEntry.save!
      end
      if device_electrical_installations2["electrical_installation_id"] != ""
        deviceElectricalInstallationEntry = DeviceElectricalInstallation.new
        deviceElectricalInstallationEntry.device = @device
        deviceElectricalInstallationEntry.electrical_installation = ElectricalInstallation.find(device_electrical_installations2["electrical_installation_id"])
        deviceElectricalInstallationEntry.definition = device_electrical_installations2["definition"]
        deviceElectricalInstallationEntry.value = device_electrical_installations2["value"]
        deviceElectricalInstallationEntry.save!
      end
      if device_electrical_installations3["electrical_installation_id"] != ""
        deviceElectricalInstallationEntry = DeviceElectricalInstallation.new
        deviceElectricalInstallationEntry.device = @device
        deviceElectricalInstallationEntry.electrical_installation = ElectricalInstallation.find(device_electrical_installations3["electrical_installation_id"])
        deviceElectricalInstallationEntry.definition = device_electrical_installations3["definition"]
        deviceElectricalInstallationEntry.value = device_electrical_installations3["value"]
        deviceElectricalInstallationEntry.save!
      end

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

    device_wires1 = params[:device][:device_wires1]
    device_wires2 = params[:device][:device_wires2]
    device_wires3 = params[:device][:device_wires3]
    deviceWireEntry1 = DeviceWire.where(:device_id => params[:id], :definition => device_wires1["definition"]).first
    deviceWireEntry2 = DeviceWire.where(:device_id => params[:id], :definition => device_wires2["definition"]).first
    deviceWireEntry3 = DeviceWire.where(:device_id => params[:id], :definition => device_wires3["definition"]).first

    device_electrical_installations1 = params[:device][:device_electrical_installations1]
    device_electrical_installations2 = params[:device][:device_electrical_installations2]
    device_electrical_installations3 = params[:device][:device_electrical_installations3]
    deviceElectricalInstallationEntry1 = DeviceElectricalInstallation.where(:device_id => params[:id],
                                                                            :definition => device_electrical_installations1["definition"]).first
    deviceElectricalInstallationEntry2 = DeviceElectricalInstallation.where(:device_id => params[:id],
                                                                            :definition => device_electrical_installations2["definition"]).first
    deviceElectricalInstallationEntry3 = DeviceElectricalInstallation.where(:device_id => params[:id],
                                                                            :definition => device_electrical_installations3["definition"]).first

    if deviceWireEntry1.nil? && device_wires1["wire_id"] != ""
      deviceWireEntry = DeviceWire.new
      deviceWireEntry.device_id = params[:id]
      deviceWireEntry.wire_id = device_wires1["wire_id"]
      deviceWireEntry.definition = device_wires1["definition"]
      deviceWireEntry.laenge = device_wires1["laenge"]
      deviceWireEntry.save!
    else
      if device_wires1["wire_id"] == ""
        if DeviceWire.where(:device_id => params[:id], :definition => device_wires1["definition"]).any?
          entryToDelete = DeviceWire.where(:device_id => params[:id], :definition => device_wires1["definition"]).first
          entryToDelete.destroy
        end
      else
        deviceWireEntry1.wire_id = device_wires1["wire_id"]
        deviceWireEntry1.laenge = device_wires1["laenge"]
        deviceWireEntry1.save!
      end
    end

    if deviceWireEntry2.nil? && device_wires2["wire_id"] != ""
      deviceWireEntry = DeviceWire.new
      deviceWireEntry.device_id = params[:id]
      deviceWireEntry.wire_id = device_wires2["wire_id"]
      deviceWireEntry.definition = device_wires2["definition"]
      deviceWireEntry.laenge = device_wires2["laenge"]
      deviceWireEntry.save!
    else
      if device_wires2["wire_id"] == ""
        if DeviceWire.where(:device_id => params[:id], :definition => device_wires2["definition"]).any?
          entryToDelete = DeviceWire.where(:device_id => params[:id], :definition => device_wires2["definition"]).first
          entryToDelete.destroy
        end
      else
        deviceWireEntry2.wire_id = device_wires2["wire_id"]
        deviceWireEntry2.laenge = device_wires2["laenge"]
        deviceWireEntry2.save!
      end
    end

    if deviceWireEntry3.nil? && device_wires3["wire_id"] != ""
      deviceWireEntry = DeviceWire.new
      deviceWireEntry.device_id = params[:id]
      deviceWireEntry.wire_id = device_wires3["wire_id"]
      deviceWireEntry.definition = device_wires3["definition"]
      deviceWireEntry.laenge = device_wires3["laenge"]
      deviceWireEntry.save!
    else
      if device_wires3["wire_id"] == ""
        if DeviceWire.where(:device_id => params[:id], :definition => device_wires3["definition"]).any?
          entryToDelete = DeviceWire.where(:device_id => params[:id], :definition => device_wires3["definition"]).first
          entryToDelete.destroy
        end
      else
        deviceWireEntry3.wire_id = device_wires3["wire_id"]
        deviceWireEntry3.laenge = device_wires3["laenge"]
        deviceWireEntry3.save!
      end
    end

    if deviceElectricalInstallationEntry1.nil? && device_electrical_installations1["electrical_installation_id"] != ""
      deviceElectricalInstallationEntry = DeviceElectricalInstallation.new
      deviceElectricalInstallationEntry.device_id = params[:id]
      deviceElectricalInstallationEntry.electrical_installation_id = device_electrical_installations1["electrical_installation_id"]
      deviceElectricalInstallationEntry.definition = device_electrical_installations1["definition"]
      deviceElectricalInstallationEntry.value = device_electrical_installations1["value"]
      deviceElectricalInstallationEntry.save!
    else
      if device_electrical_installations1["electrical_installation_id"] == ""
        if DeviceElectricalInstallation.where(:device_id => params[:id], :definition => device_electrical_installations1["definition"]).any?
          entryToDelete = DeviceElectricalInstallation.where(:device_id => params[:id], :definition => device_electrical_installations1["definition"]).first
          entryToDelete.destroy
        end
      else
        deviceElectricalInstallationEntry1.electrical_installation_id = device_electrical_installations1["electrical_installation_id"]
        deviceElectricalInstallationEntry1.value = device_electrical_installations1["value"]
        deviceElectricalInstallationEntry1.save!
      end
    end

    if deviceElectricalInstallationEntry2.nil? && device_electrical_installations2["electrical_installation_id"] != ""
      deviceElectricalInstallationEntry = DeviceElectricalInstallation.new
      deviceElectricalInstallationEntry.device_id = params[:id]
      deviceElectricalInstallationEntry.electrical_installation_id = device_electrical_installations2["electrical_installation_id"]
      deviceElectricalInstallationEntry.definition = device_electrical_installations2["definition"]
      deviceElectricalInstallationEntry.value = device_electrical_installations2["value"]
      deviceElectricalInstallationEntry.save!
    else
      if device_electrical_installations2["electrical_installation_id"] == ""
        if DeviceElectricalInstallation.where(:device_id => params[:id], :definition => device_electrical_installations2["definition"]).any?
          entryToDelete = DeviceElectricalInstallation.where(:device_id => params[:id], :definition => device_electrical_installations2["definition"]).first
          entryToDelete.destroy
        end
      else
        deviceElectricalInstallationEntry2.electrical_installation_id = device_electrical_installations2["electrical_installation_id"]
        deviceElectricalInstallationEntry2.value = device_electrical_installations2["value"]
        deviceElectricalInstallationEntry2.save!
      end
    end

    if deviceElectricalInstallationEntry3.nil? && device_electrical_installations3["electrical_installation_id"] != ""
      deviceElectricalInstallationEntry = DeviceElectricalInstallation.new
      deviceElectricalInstallationEntry.device_id = params[:id]
      deviceElectricalInstallationEntry.electrical_installation_id = device_electrical_installations3["electrical_installation_id"]
      deviceElectricalInstallationEntry.definition = device_electrical_installations3["definition"]
      deviceElectricalInstallationEntry.value = device_electrical_installations3["value"]
      deviceElectricalInstallationEntry.save!
    else
      if device_electrical_installations3["electrical_installation_id"] == ""
        if DeviceElectricalInstallation.where(:device_id => params[:id], :definition => device_electrical_installations3["definition"]).any?
          entryToDelete = DeviceElectricalInstallation.where(:device_id => params[:id], :definition => device_electrical_installations3["definition"]).first
          entryToDelete.destroy
        end
      else
        deviceElectricalInstallationEntry3.electrical_installation_id = device_electrical_installations3["electrical_installation_id"]
        deviceElectricalInstallationEntry3.value = device_electrical_installations3["value"]
        deviceElectricalInstallationEntry3.save!
      end
    end

    params[:device].delete :device_wires1
    params[:device].delete :device_wires2
    params[:device].delete :device_wires3
    params[:device].delete :device_electrical_installations1
    params[:device].delete :device_electrical_installations2
    params[:device].delete :device_electrical_installations3

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
