class SubsubprojectsController < ApplicationController
  def index
    @subsubprojects = Subsubproject.all
  end

  # Control logic for create-view
  # GET /subsubprojects/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @subsubproject = Subsubproject.new
    @subprojectid = params[:subproject_id]
  end

  # Control logic when creating a new subsubproject
  # POST /subsubprojects
  def create
    @subsubproject = Subsubproject.new(subsubproject_params)
    if params[:subsubproject][:master] == "1"
      @subproject = Subproject.find(params[:subsubproject][:subproject_id])
      @subproject.subsubprojects.each do |othersubsubproject|
        if othersubsubproject.master
          othersubsubproject.master = false
          othersubsubproject.save!
        end
      end
    end
    # write subsubproject to database
    if @subsubproject.save
      redirect_to project_subproject_path(:project_id => @subsubproject.subproject.project.id, :id => @subsubproject.subproject.id), :notice => 'Version erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /subsubprojects/:id
  def show
    @subsubproject = Subsubproject.find(params[:id])
  end

  # Control logic for edit-view
  # GET /subsubprojects/:id/edit
  def edit
    @subsubproject = Subsubproject.find(params[:id])
  end

  # Save an updated subsubproject
  # This method is either called from the subsubproject edit-view (GET /subsubprojects/:id/edit)
  # or the subsubproject filter-view (GET /subsubprojects/:id/filter)
  # PUT /subsubprojects/:id
  def update
    @subsubproject = Subsubproject.find(params[:id])
    puts 'lukas'
    puts params
    puts params[:subsubproject][:master]
    if params[:subsubproject][:master] == "1"

      @subsubproject.subproject.subsubprojects.each do |othersubsubproject|
        if othersubsubproject.master
          othersubsubproject.master = false
          othersubsubproject.save!
        end
      end
    end
    if @subsubproject.update(subsubproject_params)
      redirect_to project_subproject_path(:project_id => @subsubproject.subproject.project.id,
                                          :id => @subsubproject.subproject.id),
                  :notice => 'Version erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a subsubproject
  # DELETE /subsubprojects/:id
  def destroy
    @subsubproject = Subsubproject.find(params[:id])
    projectid = @subsubproject.subproject.project.id
    subprojectid = @subsubproject.subproject.id
    @subsubproject.destroy
    redirect_to project_subproject_path(:project_id => projectid,
                                        :id => subprojectid), :notice => 'Version wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new subsubproject
  def subsubproject_params
    params.require(:subsubproject).permit(:name, :master, :subproject_id)
  end
end
