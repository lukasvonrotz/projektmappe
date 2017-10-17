class GrobengineeringsController < ApplicationController
  def index
    @hash = Hash.new
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @subproject = @subsubproject.subproject
    @project = @subproject.project
    @grobengineerings = Grobengineering.where(:subsubproject_id => @subsubproject.id).order(:id)

    respond_to do |format|
      format.html
      format.csv { send_data @grobengineerings.to_csv, filename: "grobengineerings-#{Date.today}.csv" }
    end
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
      redirect_to project_subproject_subsubproject_grobengineerings_path(@grobengineering.subsubproject.subproject.project.id, @grobengineering.subsubproject.subproject.id, @grobengineering.subsubproject.id), :notice => 'Eintrag erfolgreich erstellt.'
    else
      render 'new'
    end
  end

  # Control logic for show-view
  # GET /grobengineerings/:id
  def show
    @grobengineering = Grobengineering.find(params[:id])
    @subsubproject = @grobengineering.subsubproject
    @subproject = @subsubproject.subproject
    @project = @subproject.project
  end

  # Control logic for edit-view
  # GET /grobengineerings/:id/edit
  def edit
    @grobengineering = Grobengineering.find(params[:id])
    @subsubproject = @grobengineering.subsubproject
    @subproject = @subsubproject.subproject
    @project = @subproject.project
  end

  # Save an updated grobengineering
  # PUT /grobengineerings/:id
  def update
    @grobengineering = Grobengineering.find(params[:id])
    if @grobengineering.update(grobengineering_params)
      redirect_to project_subproject_subsubproject_grobengineerings_path(@grobengineering.subsubproject.subproject.project.id, @grobengineering.subsubproject.subproject.id, @grobengineering.subsubproject.id), :notice => 'Eintrag erfolgreich aktualisiert.'
    else
      render 'edit'
    end
  end

  # Delete a grobengineering
  # DELETE /grobengineerings/:id
  def destroy
    @grobengineering = Grobengineering.find(params[:id])
    @grobengineering.destroy
    redirect_to project_subproject_subsubproject_grobengineerings_path(@grobengineering.subsubproject.subproject.project.id, @grobengineering.subsubproject.subproject.id, @grobengineering.subsubproject.id), :notice => 'Eintrag wurde gelöscht.'
  end

  def import
    status = Grobengineering.import(params[:file], params[:subsubproject_id])
    projectid = params[:project_id]
    subprojectid = params[:subproject_id]
    subsubprojectid = params[:subsubproject_id]
    if !(status == '')
      redirect_to project_subproject_subsubproject_grobengineerings_path(projectid, subprojectid, subsubprojectid),
                  :alert => status
    else
      redirect_to project_subproject_subsubproject_grobengineerings_path(projectid, subprojectid, subsubprojectid),
                :notice => 'Grobengineerings erfolgreich importiert.'
    end
  end

  def delete_all
    projectid = params[:project_id]
    subprojectid = params[:subproject_id]
    subsubprojectid = params[:subsubproject_id]
    Grobengineering.where(:subsubproject_id => subsubprojectid).delete_all
    redirect_to project_subproject_subsubproject_grobengineerings_path(projectid, subprojectid, subsubprojectid),
                :notice => 'Einträge erfolgreich gelöscht'
  end

  def offerte
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @subproject = @subsubproject.subproject
    @project = @subproject.project
    @grobengineerings = Grobengineering.where(:subsubproject_id => @subsubproject.id).order(:id)


    @total_geraeteanzahl = 0
    @total_elplanung = 0
    @total_planung_sw = 0
    @total_ibn_bauleitung = 0
    @total_sps_brutto = 0
    @total_sps_netto = 0
    @total_sch_brutto = 0
    @total_sch_netto = 0
    @total_io_et_brutto = 0
    @total_io_et_netto = 0
    @total_io_pilz_brutto = 0
    @total_io_pilz_netto = 0
    @total_fu_brutto = 0
    @total_fu_netto = 0
    @total_elinst_brutto = 0
    @total_elinst_netto = 0
    @total_brutto = 0
    @total_netto = 0

    @offert_hash = Grobengineering.offert_hash(@subsubproject)
    @offert_hash.each do |key1, array1|
      array1["devices"].each do |key2, array2|
        @total_geraeteanzahl += array2["device_anzahl"]
        @total_elplanung += array2["kosten_eng_elplanung_total"]
        @total_planung_sw += array2["kosten_eng_planung_sw_total"]
        @total_ibn_bauleitung += array2["kosten_eng_ibn_bauleitung_total"]
        @total_sps_brutto += array2["kosten_sps_total_brutto"]
        @total_sps_netto += array2["kosten_sps_total_netto"]
        @total_sch_brutto += array2["kosten_sch_total_brutto"]
        @total_sch_netto += array2["kosten_sch_total_netto"]
        @total_io_et_brutto += array2["kosten_io_et_total_brutto"]
        @total_io_et_netto += array2["kosten_io_et_total_netto"]
        @total_io_pilz_brutto += array2["kosten_io_pilz_total_brutto"]
        @total_io_pilz_netto += array2["kosten_io_pilz_total_netto"]
        @total_fu_brutto += array2["kosten_fu_total_brutto"]
        @total_fu_netto += array2["kosten_fu_total_netto"]
        @total_elinst_brutto += array2["kosten_elinst_total_brutto"]
        @total_elinst_netto += array2["kosten_elinst_total_netto"]
        @total_brutto += array2["kosten_total_brutto"]
        @total_netto += array2["kosten_total_netto"]
      end
    end


  end

  private
  # defines which parameters have to be provided by the form when creating a new grobengineering
  def grobengineering_params
    params.require(:grobengineering).permit!
  end

  def calc_tot(anz_devices, attribute)
    if attribute.nil?
      return ''
    else
      return anz_devices * attribute.to_f
    end
  end
  def calc_kosten_tot(hourrate, single)
    if single.nil? or hourrate.nil?
      return ''
    else
      return hourrate.to_f * single.to_f
    end
  end
end
