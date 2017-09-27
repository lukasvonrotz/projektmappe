class GrobengineeringsController < ApplicationController
  def index
    @grobengineerings = Grobengineering.all
    @hash = Hash.new
    @grobengineerings.each_with_index do |grobengineering, index|
      @hash[index] = Hash.new
      @hash[index]["strom_total"] = grobengineering.device_anzahl * grobengineering.strom
      @hash[index]["eng_admin"] = grobengineering.device_anzahl * grobengineering.device.eng_admin
      @hash[index]["eng_steuerkonzept"] = grobengineering.device_anzahl * grobengineering.device.eng_steuerkonzept
      @hash[index]["eng_ioliste"] = grobengineering.device_anzahl * grobengineering.device.eng_ioliste
      @hash[index]["eng_elplanung"] = grobengineering.device_anzahl * grobengineering.device.eng_elplanung
      @hash[index]["eng_fktbeschrieb"] = grobengineering.device_anzahl * grobengineering.device.eng_fktbeschrieb
      @hash[index]["eng_safetymatrix"] = grobengineering.device_anzahl * grobengineering.device.eng_safetymatrix
      @hash[index]["eng_software"] = (grobengineering.device_anzahl * grobengineering.device.eng_software)+ grobengineering.funktion_sw.to_f
      @hash[index]["eng_softwaresafety"] = grobengineering.device_anzahl * grobengineering.device.eng_softwaresafety
      @hash[index]["eng_bauleitung"] = grobengineering.device_anzahl * grobengineering.device.eng_bauleitung
      @hash[index]["eng_parametrierung"] = grobengineering.device_anzahl * grobengineering.device.eng_parametrierung
      @hash[index]["eng_signaltest"] = grobengineering.device_anzahl * grobengineering.device.eng_signaltest
      @hash[index]["eng_safetytest"] = grobengineering.device_anzahl * grobengineering.device.eng_safetytest
      @hash[index]["eng_fkttestkalt"] = grobengineering.device_anzahl * grobengineering.device.eng_fkttestkalt
      @hash[index]["eng_fkttestheiss"] = grobengineering.device_anzahl * grobengineering.device.eng_fkttestheiss + (0.3*grobengineering.funktion_sw.to_f)
      @hash[index]["eng_konformitaet"] = grobengineering.device_anzahl * grobengineering.device.eng_konformitaet
      @hash[index]["ger_beschriftung"] = grobengineering.device_anzahl * grobengineering.device.ger_beschriftung
      @hash[index]["ger_sensor"] = grobengineering.device_anzahl * grobengineering.device.ger_sensor
      @hash[index]["ger_ventil"] = grobengineering.device_anzahl * grobengineering.device.ger_ventil
      @hash[index]["ger_heizung"] = grobengineering.device_anzahl * grobengineering.device.ger_heizung
      @hash[index]["ger_m1r"] = grobengineering.device_anzahl * grobengineering.device.ger_m1r
      @hash[index]["ger_m2r"] = grobengineering.device_anzahl * grobengineering.device.ger_m2r
      @hash[index]["ger_mfu"] = grobengineering.device_anzahl * grobengineering.device.ger_mfu
      @hash[index]["ger_wicklung"] = grobengineering.device_anzahl * grobengineering.device.ger_wicklung
      @hash[index]["ger_bremse"] = grobengineering.device_anzahl * grobengineering.device.ger_bremse
      @hash[index]["ger_geraeteheizung"] = grobengineering.device_anzahl * grobengineering.device.ger_geraeteheizung
      @hash[index]["ger_kommunikation"] = grobengineering.device_anzahl * grobengineering.device.ger_kommunikation
      @hash[index]["ger_safety"] = grobengineering.device_anzahl * grobengineering.device.ger_safety
      @hash[index]["ger_beschriftung"] = grobengineering.device_anzahl * grobengineering.device.ger_beschriftung
      @hash[index]["sig_di"] = grobengineering.device_anzahl * grobengineering.device.sig_di
      @hash[index]["sig_do"] = grobengineering.device_anzahl * grobengineering.device.sig_do
      @hash[index]["sig_ai"] = grobengineering.device_anzahl * grobengineering.device.sig_ai
      @hash[index]["sig_ao"] = grobengineering.device_anzahl * grobengineering.device.sig_ao
      @hash[index]["sig_z"] = grobengineering.device_anzahl * grobengineering.device.sig_z
      @hash[index]["sig_inkr"] = grobengineering.device_anzahl * grobengineering.device.sig_inkr
      @hash[index]["sig_ssi"] = grobengineering.device_anzahl * grobengineering.device.sig_ssi
      @hash[index]["sig_pb"] = grobengineering.device_anzahl * grobengineering.device.sig_pb
      @hash[index]["sig_sdi"] = grobengineering.device_anzahl * grobengineering.device.sig_sdi
      @hash[index]["sig_sdo"] = grobengineering.device_anzahl * grobengineering.device.sig_sdo
      @hash[index]["sig_sai"] = grobengineering.device_anzahl * grobengineering.device.sig_sai
      @hash[index]["sig_sao"] = grobengineering.device_anzahl * grobengineering.device.sig_sao
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
