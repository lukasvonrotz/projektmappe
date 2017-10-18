class InfosController < ApplicationController

  # Control logic for create-view
  # GET /infos/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @info = Info.new
  end

  # Control logic when creating a new info
  # POST /projects/:project_id/infos
  def create
    @info = Info.new(info_params)

    # write info to database
    if @info.save
      redirect_to project_subproject_path(@info.subproject.project.id, @info.subproject.id), :notice => 'Info erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /projects/:project_id/infos/:id
  def show
    @info = Info.find(params[:id])
    @subproject = @info.subproject
    @project = @subproject.project
  end

  # Control logic for edit-view
  # GET /projects/:project_id/infos/:id/edit
  def edit
    @info = Info.find(params[:id])
  end

  # Save an updated info
  # PUT /projects/:project_id/infos/:id
  def update
    @info = Info.find(params[:id])
    if @info.update(info_params)
      redirect_to project_subproject_path(@info.subproject.project.id, @info.subproject.id), :notice => 'Info erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a info
  # DELETE /projects/:project_id/infos/:id
  def destroy
    @info = Info.find(params[:id])
    @info.destroy
    redirect_to project_subproject_path(@info.subproject.project.id, @info.subproject.id), :notice => 'Info wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new info
  def info_params
    params.require(:info).permit!
  end
end
