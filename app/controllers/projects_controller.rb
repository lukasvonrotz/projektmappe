class ProjectsController < ApplicationController
  # Auflistung aller Projekte
  # GET /projects
  def index
    @projects = Project.all
  end

  # Control logic for create-view
  # GET /projects/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @project = Project.new
  end

  # Control logic when creating a new project
  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.users << current_user
    # write project to database
    if @project.save
      redirect_to projects_path, :notice => 'Anlage erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /projects/:id
  def show
    @project = Project.find(params[:id])
  end

  # Control logic for edit-view
  # GET /projects/:id/edit
  def edit
    @project = Project.find(params[:id])
  end

  # Save an updated project
  # This method is either called from the project edit-view (GET /projects/:id/edit)
  # or the project filter-view (GET /projects/:id/filter)
  # PUT /projects/:id
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to projects_path, :notice => 'Anlage erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a project
  # DELETE /projects/:id
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path, :notice => 'Anlage wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new project
  def project_params
    params.require(:project).permit(:name, {:user_ids => []})
  end
end
