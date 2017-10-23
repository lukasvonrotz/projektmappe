class SubsubprojectsController < ApplicationController
  # Auflistung aller Versionen pro Projekt
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects
  def index
    @subproject = Subproject.find(params[:subproject_id])
    @project = @subproject.project
    @subsubprojects = Subsubproject.where(:subproject_id => @subproject.id)
  end

  # Control logic for create-view
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @subsubproject = Subsubproject.new
  end

  # Control logic when creating a new subsubproject
  # POST /projects/:project_id/subprojects/:subproject_id/subsubprojects
  def create
    @subsubproject = Subsubproject.new(subsubproject_params)
    # if the new created version is set to be master, than set all other versions to master=false
    if params[:subsubproject][:master] == "1"
      if @subsubproject.subproject.subsubprojects.any?
        @subsubproject.subproject.subsubprojects.each do |othersubsubproject|
          if othersubsubproject.master
            othersubsubproject.master = false
            othersubsubproject.save!
          end
        end
      end
    end
    # write subsubproject to database
    if @subsubproject.save
      redirect_to project_subproject_path(:project_id => @subsubproject.subproject.project.id, :id => @subsubproject.subproject.id), :notice => 'Version erfolgreich erstellt.'
    else
      #render new_project_subproject_subsubproject_path(@subsubproject.subproject.project, @subsubproject.subproject, @subsubproject)
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:id
  def show
    @subsubproject = Subsubproject.find(params[:id])
    @subproject = @subsubproject.subproject
    @project = @subproject.project
  end

  # Control logic for edit-view
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:id/edit
  def edit
    @subsubproject = Subsubproject.find(params[:id])
  end

  # Save an updated subsubproject
  # This method is either called from the subsubproject edit-view (GET /subsubprojects/:id/edit)
  # or the subsubproject filter-view (GET /subsubprojects/:id/filter)
  # PUT /projects/:project_id/subprojects/:subproject_id/subsubprojects/:id
  def update
    @subsubproject = Subsubproject.find(params[:id])
    # if the updated version is set to be master, than set all other versions to master=false
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
  # DELETE /projects/:project_id/subprojects/:subproject_id/subsubprojects/:id
  def destroy
    @subsubproject = Subsubproject.find(params[:id])
    projectid = @subsubproject.subproject.project.id
    subprojectid = @subsubproject.subproject.id
    @subsubproject.destroy
    redirect_to project_subproject_path(:project_id => projectid,
                                        :id => subprojectid), :notice => 'Version wurde gelöscht.'
  end

  # Generate signals (One per Version and Grobengineering)
  # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubproject_id/generate_signals
  def generate_signals
    subsubproject = Subsubproject.find(params[:subsubproject_id])
    subproject = subsubproject.subproject
    project = subproject.project

    records_to_save = []
    subsubproject.grobengineerings.sort_by{|e| e[:id]}.each do |grobengineering|
      new_signal = Iosignal.new
      new_signal.grobengineering = grobengineering

      if new_signal.valid? && !Iosignal.where(:grobengineering_id => grobengineering).any?
        records_to_save << new_signal
      end
    end

    records_to_save.each do |record|
      record.save!
      # Generate associated Iosignalenginfo
      new_iosignalenginfo = Iosignalenginfo.new
      new_iosignalenginfo.iosignal_id = record.id
      new_iosignalenginfo.save!
    end

    redirect_to project_subproject_subsubproject_iosignals_path(project.id, subproject.id, subsubproject.id), :notice => 'Signale wurden generiert.'
  end

  def delete_signals
    subsubproject = Subsubproject.find(params[:subsubproject_id])
    subproject = subsubproject.subproject
    project = subproject.project

    records_to_delete = []
    subsubproject.grobengineerings.each do |grobengineering|

      grobengineering.iosignals.each do |iosignal|
        records_to_delete << iosignal
      end
    end

    records_to_delete.each do |record|
      record.destroy!
    end

    redirect_to project_subproject_subsubproject_iosignals_path(project.id, subproject.id, subsubproject.id), :notice => 'Signale wurden generiert.'
  end
  private
  # defines which parameters have to be provided by the form when creating a new subsubproject
  def subsubproject_params
    params.require(:subsubproject).permit!
  end
end
