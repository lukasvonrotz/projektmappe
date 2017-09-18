class SubsystemsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @subsystems = @project.subsystems
  end

  # Control logic for create-view
  # GET /subsystems/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @subsystem = Subsystem.new
    @projectid = params[:project_id]
  end

  # Control logic when creating a new subsystem
  # POST /subsystems
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
  # GET /subsystems/:id
  def show
    @project = Project.find(params[:project_id])
    @subsystem = Subsystem.find(params[:id])
  end

  # Control logic for edit-view
  # GET /subsystems/:id/edit
  def edit
    @subsystem = Subsystem.find(params[:id])
  end

  # Save an updated subsystem
  # This method is either called from the subsystem edit-view (GET /subsystems/:id/edit)
  # or the subsystem filter-view (GET /subsystems/:id/filter)
  # PUT /subsystems/:id
  def update
    @subsystem = Subsystem.find(params[:id])
    if @subsystem.update(subsystem_params)
      redirect_to project_subsystems_path(:project_id => @subsystem.project.id), :notice => 'Teilanlage erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a subsystem
  # DELETE /subsystems/:id
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
