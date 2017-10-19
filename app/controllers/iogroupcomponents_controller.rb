class IogroupcomponentsController < ApplicationController
  # Auflistung aller IO-Gruppen-Komponenten PRO IO-Gruppe
  # GET /iogroups/:iogroup_id/iogroupcomponents
  def index
    @iogroup = Iogroup.find(params[:iogroup_id])
    @iogroupcomponents = @iogroup.iogroupcomponents

    respond_to do |format|
      format.html
      format.csv { send_data @iogroupcomponents.to_csv, filename: "iogroupcomponents-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /iogroups/:iogroup_id/iogroupcomponents/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @iogroupcomponent = Iogroupcomponent.new
  end

  # Control logic when creating a new iogroupcomponent
  # POST /iogroups/:iogroup_id/iogroupcomponents
  def create
    @iogroupcomponent = Iogroupcomponent.new(iogroupcomponent_params)
    # write iogroupcomponent to database
    if @iogroupcomponent.save
      redirect_to iogroup_iogroupcomponents_path(@iogroupcomponent.iogroup.id),
                  :notice => 'IO-Gruppen-Komponente erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for edit-view
  # GET /iogroups/:iogroup_id/iogroupcomponents/:id/edit
  def edit
    @iogroupcomponent = Iogroupcomponent.find(params[:id])
  end

  # Save an updated iogroupcomponent
  # This method is either called from the iogroupcomponent edit-view (GET /iogroupcomponents/:id/edit)
  # or the iogroupcomponent filter-view (GET /iogroupcomponents/:id/filter)
  # PUT /iogroups/:iogroup_id/iogroupcomponents/:id
  def update
    @iogroupcomponent = Iogroupcomponent.find(params[:id])
    if @iogroupcomponent.update(iogroupcomponent_params)
      redirect_to iogroup_iogroupcomponents_path(@iogroupcomponent.iogroup.id),
                  :notice => 'IO-Gruppen-Komponente erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a iogroupcomponent
  # DELETE /iogroups/:iogroup_id/iogroupcomponents/:id
  def destroy
    @iogroupcomponent = Iogroupcomponent.find(params[:id])
    @iogroupcomponent.destroy
    redirect_to iogroup_iogroupcomponents_path(@iogroupcomponent.iogroup.id),
                :notice => 'IO-Gruppen-Komponente wurde gelöscht.'
  end

  # Automatically generate all channels based on assembly
  def generate_channels
    @iogroupcomponent = Iogroupcomponent.find(params[:iogroupcomponent_id])
    notice = 'done'
    if notice != notice = generate_channels_by_type(@iogroupcomponent,'DI')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'DO')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'AI')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'AO')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'INKR')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'Z')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'SSI')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'SDI')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'SDO')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'SAI')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end
    if notice != generate_channels_by_type(@iogroupcomponent,'SAO')
      notice = 'Nicht alle Kanäle konnten generiert werden!'
    end

    redirect_to iogroup_iogroupcomponents_path(@iogroupcomponent.iogroup.id),
                :notice => (notice == 'done') ? 'Alle Kanäle wurden erfolgreich erstellt' : notice
  end

  # Delete all free channels of this Iogroupcomponent
  def delete_free_channels
    @iogroupcomponent = Iogroupcomponent.find(params[:iogroupcomponent_id])
    @iogroupcomponent.iochannels.each do |channel|
      channel.destroy!
    end
    redirect_to iogroup_iogroupcomponents_path(@iogroupcomponent.iogroup.id),
                :notice => 'Freie Kanäle wurden gelöscht'
  end

  private
  # defines which parameters have to be provided by the form when creating a new iogroupcomponent
  def iogroupcomponent_params
    params.require(:iogroupcomponent).permit!
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
      records_to_save.each do |record|
        record.save!
      end
      index += 1
      kanalnummer += 1
    end
    return 'done'
  end
end
