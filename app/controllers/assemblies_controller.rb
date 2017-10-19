class AssembliesController < ApplicationController
  # Auflistung aller IO-Baugruppen
  # GET /assemblies
  def index
    @assemblies = Assembly.all

    respond_to do |format|
      format.html
      format.csv { send_data @assemblies.to_csv, filename: "assemblies-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /assemblies/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @assembly = Assembly.new
    # !! ATTENTION !!
    # Dont create more variables here for being used in the new-view !! Because this method is NOT called again
    # if an error happens (if new object cant be saved) in the create method (see below)!
    # Render 'new' only calls the new-view again and not the new-method!!
    # !! ATTENTION !!
  end

  # Control logic when creating a new assembly
  # POST /assemblies
  def create
    @assembly = Assembly.new(assembly_params)
    # write assembly to database
    if @assembly.save
      redirect_to assemblies_path, :notice => 'Baugruppe erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /assemblies/:id
  def show
    @assembly = Assembly.find(params[:id])
  end

  # Control logic for edit-view
  # GET /assemblies/:id/edit
  def edit
    @assembly = Assembly.find(params[:id])
    # !! ATTENTION !!
    # Dont create more variables here for being used in the edit-view !! Because this method is NOT called again
    # if an error happens (if new object cant be saved) in the update method (see below)!
    # Render 'edit' only calls the edit-view again and not the new-method!!
    # !! ATTENTION !!
  end

  # Save an updated assembly
  # This method is either called from the assembly edit-view (GET /assemblies/:id/edit)
  # or the assembly filter-view (GET /assemblies/:id/filter)
  # PUT /assemblies/:id
  def update
    @assembly = Assembly.find(params[:id])
    if @assembly.update(assembly_params)
      redirect_to assemblies_path, :notice => 'Baugruppe erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a assembly
  # DELETE /assemblies/:id
  def destroy
    @assembly = Assembly.find(params[:id])
    @assembly.destroy
    redirect_to assemblies_path, :notice => 'Baugruppe wurde gelöscht.'
  end

  # CSV Import
  def import
    status = Assembly.import(params[:file])
    if !(status == '')
      redirect_to assemblies_path, :alert => status
    else
      redirect_to assemblies_path, :notice => 'IO-Baugruppen erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new assembly
  def assembly_params
    params.require(:assembly).permit!
  end
end
