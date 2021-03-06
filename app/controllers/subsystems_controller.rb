class SubsystemsController < ApplicationController
  # Auflistung aller Teilanlagen pro Anlage
  # GET /projects/:project_id/subsystems
  def index
    @project = Project.find(params[:project_id])
    @subsystems = @project.subsystems

    respond_to do |format|
      format.html
      format.csv { send_data @subsystems.to_csv, filename: "subsystems-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /project/:project_id/subsystems/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @subsystem = Subsystem.new
  end

  # Control logic when creating a new subsystem
  # POST /project/:project_id/subsystems
  def create
    @subsystem = Subsystem.new(subsystem_params)
    # write subsystem to database
    if @subsystem.save
      redirect_to project_subsystems_path(:project_id => @subsystem.project.id), :notice => 'Teilanlage erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /project/:project_id/subsystems/:id
  def show
    @subsystem = Subsystem.find(params[:id])
    @project = @subsystem.project
  end

  # Control logic for edit-view
  # GET /project/:project_id/subsystems/:id/edit
  def edit
    @subsystem = Subsystem.find(params[:id])
  end

  # Save an updated subsystem
  # This method is either called from the subsystem edit-view (GET /subsystems/:id/edit)
  # or the subsystem filter-view (GET /subsystems/:id/filter)
  # PUT /project/:project_id/subsystems/:id
  def update
    @subsystem = Subsystem.find(params[:id])
    if @subsystem.update(subsystem_params)
      redirect_to project_subsystems_path(:project_id => @subsystem.project.id), :notice => 'Teilanlage erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a subsystem
  # DELETE /project/:project_id/subsystems/:id
  def destroy
    @subsystem = Subsystem.find(params[:id])
    projectid = @subsystem.project.id
    @subsystem.destroy
    redirect_to project_subsystems_path(:project_id => projectid), :notice => 'Teilanlage wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new subsystem
  def subsystem_params
    params.require(:subsystem).permit(:name, :project_id)
  end
end
