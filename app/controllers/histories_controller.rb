class HistoriesController < ApplicationController
  # Control logic for create-view
  # GET /histories/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @history = History.new
  end

  # Control logic when creating a new history
  # POST /histories
  def create
    @history = History.new(history_params)

    # write history to database
    if @history.save
      redirect_to project_subproject_path(@history.subproject.project.id, @history.subproject.id), :notice => 'History erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /histories/:id
  def show
    @history = History.find(params[:id])
    @subproject = @history.subproject
    @project = @subproject.project
  end

  # Control logic for edit-view
  # GET /histories/:id/edit
  def edit
    @history = History.find(params[:id])
    @subproject = @history.subproject
    @project = @subproject.project
  end

  # Save an updated history
  # PUT /histories/:id
  def update
    @history = History.find(params[:id])
    if @history.update(history_params)
      redirect_to project_subproject_path(@history.subproject.project.id, @history.subproject.id), :notice => 'History erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a history
  # DELETE /histories/:id
  def destroy
    @history = History.find(params[:id])
    @history.destroy
    redirect_to project_subproject_path(@history.subproject.project.id, @history.subproject.id), :notice => 'History wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new history
  def history_params
    params.require(:history).permit!
  end
end
