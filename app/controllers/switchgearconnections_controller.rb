class SwitchgearconnectionsController < ApplicationController

  def index
    @switchgearconnections = Switchgearconnection.all

    respond_to do |format|
      format.html
      format.csv { send_data @switchgearconnections.to_csv, filename: "switchgearconnections-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /switchgearconnections/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @switchgearconnection = Switchgearconnection.new
  end

  # Control logic when creating a new switchgearconnection
  # POST /switchgearconnections
  def create
    @switchgearconnection = Switchgearconnection.new(switchgearconnection_params)

    # write switchgearconnection to database
    if @switchgearconnection.save
      redirect_to switchgearconnections_path, :notice => 'Schaltgerätekombination erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /switchgearconnections/:id
  def show
    @switchgearconnection = Switchgearconnection.find(params[:id])
  end

  # Control logic for edit-view
  # GET /switchgearconnections/:id/edit
  def edit
    @switchgearconnection = Switchgearconnection.find(params[:id])
  end

  # Save an updated switchgearconnection
  # PUT /switchgearconnections/:id
  def update
    @switchgearconnection = Switchgearconnection.find(params[:id])
    if @switchgearconnection.update(switchgearconnection_params)
      redirect_to switchgearconnections_path, :notice => 'Schaltgerätekombination erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a switchgearconnection
  # DELETE /switchgearconnections/:id
  def destroy
    @switchgearconnection = Switchgearconnection.find(params[:id])
    @switchgearconnection.destroy
    redirect_to switchgearconnections_path, :notice => 'Schaltgerätekombination wurde gelöscht.'
  end


  def import
    status = Switchgearconnection.import(params[:file])
    if !(status == '')
      redirect_to switchgearconnections_path, :alert => status
    else
      redirect_to switchgearconnections_path, :notice => 'Verbindungen erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new switchgearconnection
  def switchgearconnection_params
    params.require(:switchgearconnection).permit!
  end
end
