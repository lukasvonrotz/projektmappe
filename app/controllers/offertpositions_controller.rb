class OffertpositionsController < ApplicationController
  def index
    @offertpositions = Offertposition.where(:subsubproject_id => params[:subsubproject_id])
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @subproject = @subsubproject.subproject
    @project = @subproject.project

    respond_to do |format|
      format.html
      format.csv { send_data @offertpositions.to_csv, filename: "offertpositions-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /offertpositions/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @offertposition = Offertposition.new
  end

  # Control logic when creating a new offertposition
  # POST /offertpositions
  def create
    @offertposition = Offertposition.new(offertposition_params)

    # write offertposition to database
    if @offertposition.save
      redirect_to project_subproject_subsubproject_offertpositions_path(@offertposition.subsubproject.subproject.project.id, @offertposition.subsubproject.subproject.id, @offertposition.subsubproject.id), :notice => 'Offertposition erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /offertpositions/:id
  def show
    @offertposition = Offertposition.find(params[:id])
  end

  # Control logic for edit-view
  # GET /offertpositions/:id/edit
  def edit
    @offertposition = Offertposition.find(params[:id])
  end

  # Save an updated offertposition
  # PUT /offertpositions/:id
  def update
    @offertposition = Offertposition.find(params[:id])
    if @offertposition.update(offertposition_params)
      redirect_to project_subproject_subsubproject_offertpositions_path(@offertposition.subsubproject.subproject.project.id, @offertposition.subsubproject.subproject.id, @offertposition.subsubproject.id), :notice => 'Offertposition erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a offertposition
  # DELETE /offertpositions/:id
  def destroy
    @offertposition = Offertposition.find(params[:id])
    @offertposition.destroy
    redirect_to project_subproject_subsubproject_offertpositions_path(@offertposition.subsubproject.subproject.project.id, @offertposition.subsubproject.subproject.id, @offertposition.subsubproject.id), :notice => 'Offertposition wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new offertposition
  def offertposition_params
    params.require(:offertposition).permit!
  end
end
