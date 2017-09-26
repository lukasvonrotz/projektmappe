class GrobengineeringsController < ApplicationController
  def index
    @grobengineerings = Grobengineering.all
  end

  # Control logic for create-view
  # GET /grobengineerings/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @grobengineering = Grobengineering.new
  end

  # Control logic when creating a new grobengineering
  # POST /grobengineerings
  def create
    @grobengineering = Grobengineering.new(grobengineering_params)

    # write grobengineering to database
    if @grobengineering.save
      redirect_to grobengineerings_path, :notice => 'Eintrag erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /grobengineerings/:id
  def show
    @grobengineering = Grobengineering.find(params[:id])
  end

  # Control logic for edit-view
  # GET /grobengineerings/:id/edit
  def edit
    @grobengineering = Grobengineering.find(params[:id])
  end

  # Save an updated grobengineering
  # PUT /grobengineerings/:id
  def update
    @grobengineering = Grobengineering.find(params[:id])
    if @grobengineering.update(grobengineering_params)
      redirect_to grobengineerings_path, :notice => 'Eintrag erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a grobengineering
  # DELETE /grobengineerings/:id
  def destroy
    @grobengineering = Grobengineering.find(params[:id])
    @grobengineering.destroy
    redirect_to grobengineerings_path, :notice => 'Eintrag wurde gelöscht.'
  end

  private
  # defines which parameters have to be provided by the form when creating a new grobengineering
  def grobengineering_params
    params.require(:grobengineering).permit(:offertposition, :beschreibung, :kommentar, :device_import, :device_anzahl,
    :update_necessary, :tagnr, :tagname)
  end
end
