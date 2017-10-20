class IosignalsController < ApplicationController
    # Auflistung aller Iosignals PRO Version
    # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals
    def index
      @subsubproject = Subsubproject.find(params[:subsubproject_id])
      @subproject = @subsubproject.subproject
      @project = @subproject.project

      @iosignals = []
      Grobengineering.where(:subsubproject_id => @subsubproject.id).each do |grobengineering|
        grobengineering.iosignals.each do |iosignal|
          @iosignals << iosignal
        end
      end

      respond_to do |format|
        format.html
        format.csv { send_data @iosignals.to_csv, filename: "iosignals-#{Date.today}.csv" }
      end
    end

    # Control logic for create-view
    # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals/new
    def new
      # build a 'temporary' post which is written to DB later (create-method)
      @iosignal = Iosignal.new
    end

    # Control logic when creating a new iosignal
    # POST /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals
    def create
      @iosignal = Iosignal.new(iosignal_params)
      @subsubproject = @iosignal.grobengineering.subsubproject
      @subproject = @subsubproject.subproject
      @project = @subproject.project
      # write iosignal to database
      if @iosignal.save
        redirect_to project_subproject_subsubproject_iosignals_path(@project.id, @subproject.id, @subsubproject.id), :notice => 'Eintrag erfolgreich erstellt.'
      else
        render 'new'
      end
    end

    # Control logic for show-view
    # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals/:id
    def show
      @iosignal = Iosignal.find(params[:id])
      @subsubproject = @iosignal.grobengineering.subsubproject
      @subproject = @subsubproject.subproject
      @project = @subproject.project
    end

    # Control logic for edit-view
    # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals/:id/edit
    def edit
      @iosignal = Iosignal.find(params[:id])
    end

    # Save an updated iosignal
    # PUT /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals/:id
    def update
      @iosignal = Iosignal.find(params[:id])
      @subsubproject = @iosignal.grobengineering.subsubproject
      @subproject = @subsubproject.subproject
      @project = @subproject.project

      if @iosignal.update(iosignal_params)
        redirect_to project_subproject_subsubproject_iosignals_path(@project.id, @subproject.id, @subsubproject.id), :notice => 'Eintrag erfolgreich aktualisiert.'
      else
        render 'edit'
      end
    end

    # Delete a iosignal
    # DELETE /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals/:id
    def destroy
      @iosignal = Iosignal.find(params[:id])
      @subsubproject = @iosignal.grobengineering.subsubproject
      @subproject = @subsubproject.subproject
      @project = @subproject.project

      @iosignal.destroy
      redirect_to project_subproject_subsubproject_iosignals_path(@project.id, @subproject.id, @subsubproject.id), :notice => 'Eintrag wurde gelöscht.'
    end

    # CSV Import
    def import
      status = Iosignal.import(params[:file], params[:subsubproject_id])
      projectid = params[:project_id]
      subprojectid = params[:subproject_id]
      subsubprojectid = params[:subsubproject_id]
      if !(status == '')
        redirect_to project_subproject_subsubproject_iosignals_path(projectid, subprojectid, subsubprojectid),
                    :alert => status
      else
        redirect_to project_subproject_subsubproject_iosignals_path(projectid, subprojectid, subsubprojectid),
                    :notice => 'Iosignals erfolgreich importiert.'
      end
    end

    # Delete all Iosignal-Entries in specific version
    # GET /projects/:project_id/subprojects/:subproject_id/subsubprojects/:subsubprojects_id/iosignals/delete_all
    def delete_all
      projectid = params[:project_id]
      subprojectid = params[:subproject_id]
      subsubprojectid = params[:subsubproject_id]
      Iosignal.where(:subsubproject_id => subsubprojectid).delete_all
      redirect_to project_subproject_subsubproject_iosignals_path(projectid, subprojectid, subsubprojectid),
                  :notice => 'Einträge erfolgreich gelöscht'
    end

    private
    # defines which parameters have to be provided by the form when creating a new iosignal
    def iosignal_params
      params.require(:iosignal).permit!
    end

end
