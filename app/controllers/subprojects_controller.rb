class SubprojectsController < ApplicationController
    def index
      @subprojects = Subproject.all
    end

    # Control logic for create-view
    # GET /subprojects/new
    def new
      # build a 'temporary' post which is written to DB later (create-method)
      @subproject = Subproject.new
    end

    # Control logic when creating a new subproject
    # POST /subprojects
    def create
      @subproject = Subproject.new(subproject_params)
      @subproject.users << current_user
      # write subproject to database
      if @subproject.save
        redirect_to subprojects_path, :notice => 'Projekt erfolgreich erstellt.'
      else
        render 'new'
      end
    end

    # Control logic for show-view
    # GET /subprojects/:id
    def show
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
        redirect_to subprojects_path, :notice => 'Projekt erfolgreich aktualisiert.'
      else
        render 'edit'
      end
    end

    # Delete a subproject
    # DELETE /subprojects/:id
    def destroy
      @subproject = Subproject.find(params[:id])
      @subproject.destroy
      redirect_to subprojects_path, :notice => 'Projekt wurde gelöscht.'
    end

    private
    # defines which parameters have to be provided by the form when creating a new subproject
    def subproject_params
      params.require(:subproject).permit(:name, {:user_ids => []})
    end
end
