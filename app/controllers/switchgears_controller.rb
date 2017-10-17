class SwitchgearsController < ApplicationController
  def index
    @switchgears = Switchgear.all

    respond_to do |format|
      format.html
      format.csv { send_data @switchgears.to_csv, filename: "switchgears-#{Date.today}.csv" }
    end

  end

  # Control logic for create-view
  # GET /switchgears/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @switchgear = Switchgear.new
  end

  # Control logic when creating a new switchgear
  # POST /switchgears
  def create
    @switchgear = Switchgear.new(switchgear_params)
    # write switchgear to database
    if @switchgear.save
      redirect_to switchgears_path, :notice => 'Eintrag erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /switchgears/:id
  def show
    @switchgear = Switchgear.find(params[:id])
  end

  # Control logic for edit-view
  # GET /switchgears/:id/edit
  def edit
    @switchgear = Switchgear.find(params[:id])
  end

  # Save an updated switchgear
  # This method is either called from the switchgear edit-view (GET /switchgears/:id/edit)
  # or the switchgear filter-view (GET /switchgears/:id/filter)
  # PUT /switchgears/:id
  def update
    @switchgear = Switchgear.find(params[:id])
    if @switchgear.update(switchgear_params)
      redirect_to switchgears_path, :notice => 'Eintrag erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a switchgear
  # DELETE /switchgears/:id
  def destroy
    @switchgear = Switchgear.find(params[:id])
    @switchgear.destroy
    redirect_to switchgears_path, :notice => 'Eintrag wurde gelöscht.'
  end

  def import
    status = Switchgear.import(params[:file])
    if !(status == '')
      redirect_to switchgears_path, :alert => status
    else
      redirect_to switchgears_path, :notice => 'Schaltanlagenbau erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new switchgear
  def switchgear_params
    params.require(:switchgear).permit!
  end
end
