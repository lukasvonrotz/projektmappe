class DrivesController < ApplicationController
  # Auflistung aller FUs
  # GET /drives
  def index
    @drives = Drive.all

    respond_to do |format|
      format.html
      format.csv { send_data @drives.to_csv, filename: "drives-#{Date.today}.csv" }
    end
  end

  # Control logic for create-view
  # GET /drives/new
  def new
    # build a 'temporary' post which is written to DB later (create-method)
    @drive = Drive.new
  end

  # Control logic when creating a new drive
  # POST /drives
  def create
    @drive = Drive.new(drive_params)
    # write drive to database
    if @drive.save
      redirect_to drives_path, :notice => 'Frequenzumrichter erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /drives/:id
  def show
    @drive = Drive.find(params[:id])
  end

  # Control logic for edit-view
  # GET /drives/:id/edit
  def edit
    @drive = Drive.find(params[:id])
  end

  # Save an updated drive
  # This method is either called from the drive edit-view (GET /drives/:id/edit)
  # or the drive filter-view (GET /drives/:id/filter)
  # PUT /drives/:id
  def update
    @drive = Drive.find(params[:id])
    if @drive.update(drive_params)
      redirect_to drives_path, :notice => 'Frequenzumrichter erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a drive
  # DELETE /drives/:id
  def destroy
    @drive = Drive.find(params[:id])
    @drive.destroy
    redirect_to drives_path, :notice => 'Frequenzumrichter wurde gelöscht.'
  end

  # CSV Import
  def import
    status = Drive.import(params[:file])
    if !(status == '')
      redirect_to drives_path, :alert => status
    else
      redirect_to drives_path, :notice => 'FU-Liste erfolgreich aktualisiert.'
    end
  end

  private
  # defines which parameters have to be provided by the form when creating a new drive
  def drive_params
    params.require(:drive).permit!
  end
end
