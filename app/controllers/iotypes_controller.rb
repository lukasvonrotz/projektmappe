class IotypesController < ApplicationController
  def index
    @iotypes = Iotype.all

    respond_to do |format|
      format.html
      format.csv { send_data @iotypes.to_csv, filename: "iotypes-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /iotypes/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @iotype = Iotype.new
  end

  # Control logic when creating a new iotype
  # POST /iotypes
  def create
    @iotype = Iotype.new(iotype_params)

    # write iotype to database
    if @iotype.save
      redirect_to iotypes_path, :notice => 'IO-Gruppentyp erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /iotypes/:id
  def show
    @iotype = Iotype.find(params[:id])
  end

  # Control logic for edit-view
  # GET /iotypes/:id/edit
  def edit
    @iotype = Iotype.find(params[:id])
  end

  # Save an updated iotype
  # PUT /iotypes/:id
  def update
    @iotype = Iotype.find(params[:id])
    if @iotype.update(iotype_params)
      redirect_to iotypes_path, :notice => 'IO-Gruppentyp erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a iotype
  # DELETE /iotypes/:id
  def destroy
    @iotype = Iotype.find(params[:id])
    if @iotype.iogroups.any?
      redirect_to iotypes_path, :notice => 'IO-Gruppentyp kann nicht gelöscht werden, da bereits IO-Gruppen mit diesem Typ verknüpft sind.'
    else
      @iotype.destroy
      redirect_to iotypes_path, :notice => 'IO-Gruppentyp wurde gelöscht.'
    end
  end

  def import
    status = Iotype.import(params[:file])
    if !(status == '')
      redirect_to iotypes_path, :alert => status
    else
      redirect_to iotypes_path, :notice => 'IO-Typen-Liste erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new iotype
  def iotype_params
    params.require(:iotype).permit!
  end
end
