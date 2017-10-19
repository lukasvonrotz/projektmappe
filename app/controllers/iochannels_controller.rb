class IochannelsController < ApplicationController
  # Auflistung aller Kanaln pro Anlage
  # GET /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels
  def index
    @iogroupcomponent = Iogroupcomponent.find(params[:iogroupcomponent_id])
    @iogroup = @iogroupcomponent.iogroup
    @iochannels = @iogroupcomponent.iochannels

    respond_to do |format|
      format.html
      format.csv { send_data @iochannels.to_csv, filename: "iochannels-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @iochannel = Iochannel.new
  end

  # Control logic when creating a new iochannel
  # POST /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels
  def create
    @iochannel = Iochannel.new(iochannel_params)
    # write iochannel to database
    if @iochannel.save
      redirect_to iogroup_iogroupcomponent_iochannels_path(@iochannel.iogroupcomponent.iogroup.id, @iochannel.iogroupcomponent.id), :notice => 'Kanal erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels/:id
  def show
    @iochannel = Iochannel.find(params[:id])
    @project = @iochannel.project
  end

  # Control logic for edit-view
  # GET /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels/:id/edit
  def edit
    @iochannel = Iochannel.find(params[:id])
  end

  # Save an updated iochannel
  # This method is either called from the iochannel edit-view (GET /iochannels/:id/edit)
  # or the iochannel filter-view (GET /iochannels/:id/filter)
  # PUT /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels/:id
  def update
    @iochannel = Iochannel.find(params[:id])
    if @iochannel.update(iochannel_params)
      redirect_to iogroup_iogroupcomponent_iochannels_path(@iochannel.iogroupcomponent.iogroup.id, @iochannel.iogroupcomponent.id), :notice => 'Kanal erfolgreich erstellt.'
    else
      render 'edit'
    end
  end

  # Delete a iochannel
  # DELETE /iogroups/:iogroup_id/iogroupcomponents/:iogroupcomponent_id/iochannels/:id
  def destroy
    @iochannel = Iochannel.find(params[:id])
    @iochannel.destroy
    redirect_to iogroup_iogroupcomponent_iochannels_path(@iochannel.iogroupcomponent.iogroup.id, @iochannel.iogroupcomponent.id), :notice => 'Kanal erfolgreich erstellt.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new iochannel
  def iochannel_params
    params.require(:iochannel).permit!
  end
end
