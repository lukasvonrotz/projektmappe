class IogroupsController < ApplicationController
  # Auflistung aller IO-Gruppen
  # GET /iogroups
  def index
    @iogroups = Iogroup.all

    respond_to do |format|
      format.html
      format.csv { send_data @iogroups.to_csv, filename: "iogroups-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /iogroups/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @iogroup = Iogroup.new
  end

  # Control logic when creating a new iogroup
  # POST /iogroups
  def create
    @iogroup = Iogroup.new(iogroup_params)

    # write iogroup to database
    if @iogroup.save
      redirect_to iogroups_path, :notice => 'IO-Gruppe erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /iogroups/:id
  def show
    @iogroup = Iogroup.find(params[:id])
  end

  # Control logic for edit-view
  # GET /iogroups/:id/edit
  def edit
    @iogroup = Iogroup.find(params[:id])
  end

  # Save an updated iogroup
  # PUT /iogroups/:id
  def update
    @iogroup = Iogroup.find(params[:id])
    if @iogroup.update(iogroup_params)
      redirect_to iogroups_path, :notice => 'IO-Gruppe erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a iogroup
  # DELETE /iogroups/:id
  def destroy
    @iogroup = Iogroup.find(params[:id])
    @iogroup.destroy
    redirect_to iogroups_path, :notice => 'IO-Gruppe wurde gelöscht.'
  end

  # CSV Import
  def import
    status = Iogroup.import(params[:file])
    if !(status == '')
      redirect_to iogroups_path, :alert => status
    else
      redirect_to iogroups_path, :notice => 'IO-Gruppen erfolgreich aktualisiert.'
    end
  end

  # Automatically generate all channels based on assembly
  def generate_iogroup_channels
    @iogroup = Iogroup.find(params[:iogroup_id])
    @iogroup.iogroupcomponents.each do |iogroupcomponent|

      notice = 'done'
      if notice != notice = generate_channels_by_type(iogroupcomponent,'DI')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'DO')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'AI')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'AO')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'INKR')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'Z')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'SSI')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'SDI')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'SDO')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'SAI')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
      if notice != generate_channels_by_type(iogroupcomponent,'SAO')
        notice = 'Nicht alle Kanäle konnten generiert werden!'
      end
    end

    redirect_to iogroups_path, :notice => (notice == 'done') ? 'Alle Kanäle wurden erfolgreich erstellt' : notice
  end

  # Delete all free channels of this Iogroupcomponent
  def delete_free_iogroup_channels
    @iogroup = Iogroup.find(params[:iogroup_id])
    @iogroup.iogroupcomponents.each do |iogroupcomponent|
      iogroupcomponent.iochannels.each do |channel|
        channel.destroy!
      end
    end

    redirect_to iogroups_path, :notice => 'Freie Kanäle wurden gelöscht'
  end


  private
  # defines which parameters have to be provided by the form when creating a new iogroup
  def iogroup_params
    params.require(:iogroup).permit(:name, :profibus_address, :iotype_id, :switchgearcombination_id,
                                    {:assembly_ids => []})
  end

  def generate_channels_by_type(iogroupcomponent, type)
    counter_internal = 0
    case type
      when 'DI'
        anzahl = iogroupcomponent.assembly.di.to_i
      when 'DO'
        anzahl = iogroupcomponent.assembly.do.to_i
      when 'AI'
        anzahl = iogroupcomponent.assembly.ai.to_i
      when 'AO'
        anzahl = iogroupcomponent.assembly.ao.to_i
      when 'INKR'
        anzahl = iogroupcomponent.assembly.inkr.to_i
      when 'Z'
        anzahl = iogroupcomponent.assembly.z.to_i
      when 'SSI'
        anzahl = iogroupcomponent.assembly.ssi.to_i
      when 'SDI'
        anzahl = iogroupcomponent.assembly.sdi.to_i
      when 'SDO'
        anzahl = iogroupcomponent.assembly.sdo.to_i
      when 'SAI'
        anzahl = iogroupcomponent.assembly.sai.to_i
      when 'SAO'
        anzahl = iogroupcomponent.assembly.sao.to_i
      else
        return 'Check types in iogroupcomponents_controller'
    end
    index = 0
    kanalnummer = iogroupcomponent.assembly.kanal_startnummer
    records_to_save = []
    while index < anzahl do
      new_channel = Iochannel.new
      new_channel.kanalnummer = kanalnummer
      new_channel.channeltype = type
      new_channel.iogroupcomponent = iogroupcomponent
      if new_channel.valid?
        records_to_save << new_channel
      end
      index += 1
      kanalnummer += 1
    end

    records_to_save.each do |record|
      record.save!
    end

    return 'done'
  end
end
