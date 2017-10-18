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

  private
  # defines which parameters have to be provided by the form when creating a new iogroupcomponent
  def iogroupcomponent_params
    params.require(:iogroupcomponent).permit!
  end
end
