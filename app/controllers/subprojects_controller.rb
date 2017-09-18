class SubprojectsController < ApplicationController
    def index
      @project = Project.find(params[:project_id])
      @subprojects = @project.subprojects
    end

    # Control logic for create-view
    # GET /subprojects/new
    def new
      # build a 'temporary' post which is written to DB later (create-method)
      @subproject = Subproject.new
      @projectid = params[:project_id]
    end

    # Control logic when creating a new subproject
    # POST /subprojects
    def create
      @subproject = Subproject.new(subproject_params)
      @subproject.users << current_user
      # write subproject to database
      if @subproject.save
        redirect_to project_subprojects_path(:project_id => @subproject.project.id), :notice => 'Projekt erfolgreich erstellt.'
      else
        render 'new'
      end
    end

    # Control logic for show-view
    # GET /subprojects/:id
    def show
      @project = Project.find(params[:project_id])
      @subproject = Subproject.find(params[:id])
    end

    # Control logic for edit-view
    # GET /subprojects/:id/edit
    def edit
      @subproject = Subproject.find(params[:id])
    end

    # Save an updated subproject
    # This method is either called from the subproject edit-view (GET /subprojects/:id/edit)
    # or the subproject filter-view (GET /subprojects/:id/filter)
    # PUT /subprojects/:id
    def update
      @subproject = Subproject.find(params[:id])
      if @subproject.update(subproject_params)
        redirect_to project_subprojects_path(:project_id => @subproject.project.id), :notice => 'Projekt erfolgreich aktualisiert.'
      else
        render 'edit'
      end
    end

    # Delete a subproject
    # DELETE /subprojects/:id
    def destroy
      @subproject = Subproject.find(params[:id])
      projectid = @subproject.project.id
      @subproject.destroy
      redirect_to project_subprojects_path(:project_id => projectid), :notice => 'Projekt wurde gelöscht.'
    end

    private
    # defines which parameters have to be provided by the form when creating a new subproject
    def subproject_params
      params.require(:subproject).permit(:name, {:user_ids => []}, :project_id, :customer_id)
    end
end
