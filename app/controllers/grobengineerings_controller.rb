class GrobengineeringsController < ApplicationController
  def index
    @hash = Hash.new
    @subsubproject = Subsubproject.find(params[:subsubproject_id])
    @grobengineerings = Grobengineering.where(:subsubproject_id => @subsubproject.id).order(:id)
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
    redirect_to project_subproject_subsubproject_grobengineerings_path(projectid, subprojectid, subsubprojectid),
                :notice => status
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
    @grobengineerings = Grobengineering.where(:subsubproject_id => @subsubproject.id).order(:id)

    @total_geraeteanzahl = 0
    @total_elplanung = 0
    @total_planung_sw = 0
    @total_ibn_bauleitung = 0
    @total_sps_brutto = 0
    @total_sps_netto = 0
    @total_sch_brutto = 0
    @total_sch_netto = 0
    @total_elinst_brutto = 0
    @total_elinst_netto = 0
    @total_brutto = 0
    @total_netto = 0

    @zusammenfassung = Hash.new
    @grobengineerings.group_by(&:offertposition).each do |offertposition, grobengineerings|
      @zusammenfassung[offertposition.name] = Hash.new
      @zusammenfassung[offertposition.name]["device_anzahl"] = 0
      @zusammenfassung[offertposition.name]["kosten_eng_elplanung_total"] = 0
      @zusammenfassung[offertposition.name]["kosten_eng_planung_sw_total"] = 0
      @zusammenfassung[offertposition.name]["kosten_eng_ibn_bauleitung_total"] = 0
      @zusammenfassung[offertposition.name]["kosten_sps_total_brutto"] = 0
      @zusammenfassung[offertposition.name]["kosten_sps_total_netto"] = 0
      @zusammenfassung[offertposition.name]["kosten_sch_total_brutto"] = 0
      @zusammenfassung[offertposition.name]["kosten_sch_total_netto"] = 0
      @zusammenfassung[offertposition.name]["kosten_elinst_total_brutto"] = 0
      @zusammenfassung[offertposition.name]["kosten_elinst_total_netto"] = 0
      @zusammenfassung[offertposition.name]["kosten_total_brutto"] = 0
      @zusammenfassung[offertposition.name]["kosten_total_netto"] = 0
      @zusammenfassung[offertposition.name]["devices"] = Hash.new
      grobengineerings.group_by(&:device_id).each do |device_id, lines|
        @zusammenfassung[offertposition.name]["devices"][device_id] = Hash.new
        @zusammenfassung[offertposition.name]["devices"][device_id]["device_anzahl"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_eng_elplanung_total"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_eng_planung_sw_total"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_eng_ibn_bauleitung_total"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sps_total_brutto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sps_total_netto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sch_total_brutto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sch_total_netto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_elinst_total_brutto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_elinst_total_netto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_total_brutto"] = 0
        @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_total_netto"] = 0
        lines.each do |line|
          @zusammenfassung[offertposition.name]["devices"][device_id]["device_anzahl"] += line.device_anzahl
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_eng_elplanung_total"] += line.kosten_eng_elplanung_total
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_eng_planung_sw_total"] += line.kosten_eng_planung_sw_total
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_eng_ibn_bauleitung_total"] += line.kosten_eng_ibn_bauleitung_total
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sps_total_brutto"] += line.kosten_sps_total_brutto(@subsubproject.eurokurs)
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sps_total_netto"] += line.kosten_sps_total_netto(@subsubproject.eurokurs)
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sch_total_brutto"] += line.kosten_sch_total_brutto
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_sch_total_netto"] += line.kosten_sch_total_netto
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_elinst_total_brutto"] += line.kosten_elinst_total_brutto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier)
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_elinst_total_netto"] += line.kosten_elinst_total_netto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier)
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_total_brutto"] += line.kosten_total_brutto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier, @subsubproject.proiorechnen, @subsubproject.eurokurs)
          @zusammenfassung[offertposition.name]["devices"][device_id]["kosten_total_netto"] += line.kosten_total_netto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier, @subsubproject.proiorechnen, @subsubproject.eurokurs)

          @zusammenfassung[offertposition.name]["device_anzahl"] += line.device_anzahl
          @zusammenfassung[offertposition.name]["kosten_eng_elplanung_total"] += line.kosten_eng_elplanung_total
          @zusammenfassung[offertposition.name]["kosten_eng_planung_sw_total"] += line.kosten_eng_planung_sw_total
          @zusammenfassung[offertposition.name]["kosten_eng_ibn_bauleitung_total"] += line.kosten_eng_ibn_bauleitung_total
          @zusammenfassung[offertposition.name]["kosten_sps_total_brutto"] += line.kosten_sps_total_brutto(@subsubproject.eurokurs)
          @zusammenfassung[offertposition.name]["kosten_sps_total_netto"] += line.kosten_sps_total_netto(@subsubproject.eurokurs)
          @zusammenfassung[offertposition.name]["kosten_sch_total_brutto"] += line.kosten_sch_total_brutto
          @zusammenfassung[offertposition.name]["kosten_sch_total_netto"] += line.kosten_sch_total_netto
          @zusammenfassung[offertposition.name]["kosten_elinst_total_brutto"] += line.kosten_elinst_total_brutto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier)
          @zusammenfassung[offertposition.name]["kosten_elinst_total_netto"] += line.kosten_elinst_total_netto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier)
          @zusammenfassung[offertposition.name]["kosten_total_brutto"] += line.kosten_total_brutto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier, @subsubproject.proiorechnen, @subsubproject.eurokurs)
          @zusammenfassung[offertposition.name]["kosten_total_netto"] += line.kosten_total_netto(@subsubproject.wiresupplier, @subsubproject.wirecaptionsupplier, @subsubproject.proiorechnen, @subsubproject.eurokurs)
        end
      end
      @total_geraeteanzahl += @zusammenfassung[offertposition.name]["device_anzahl"]
      @total_elplanung += @zusammenfassung[offertposition.name]["kosten_eng_elplanung_total"]
      @total_planung_sw += @zusammenfassung[offertposition.name]["kosten_eng_planung_sw_total"]
      @total_ibn_bauleitung += @zusammenfassung[offertposition.name]["kosten_eng_ibn_bauleitung_total"]
      @total_sps_brutto += @zusammenfassung[offertposition.name]["kosten_sps_total_brutto"]
      @total_sps_netto += @zusammenfassung[offertposition.name]["kosten_sps_total_netto"]
      @total_sch_brutto += @zusammenfassung[offertposition.name]["kosten_sch_total_brutto"]
      @total_sch_netto += @zusammenfassung[offertposition.name]["kosten_sch_total_netto"]
      @total_elinst_brutto += @zusammenfassung[offertposition.name]["kosten_elinst_total_brutto"]
      @total_elinst_netto += @zusammenfassung[offertposition.name]["kosten_elinst_total_netto"]
      @total_brutto += @zusammenfassung[offertposition.name]["kosten_total_brutto"]
      @total_netto += @zusammenfassung[offertposition.name]["kosten_total_netto"]
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

=begin
    @grobengineerings.each_with_index do |grobengineering, index|
      @hash[index] = Hash.new
      if !grobengineering.device_anzahl.nil?
        anz_devices = grobengineering.device_anzahl.to_f
        @hash[index]["strom_total"] = calc_tot(anz_devices, grobengineering.strom)
        @hash[index]["eng_admin"] = calc_tot(anz_devices, grobengineering.device.eng_admin)
        @hash[index]["eng_steuerkonzept"] = calc_tot(anz_devices, grobengineering.device.eng_steuerkonzept)
        @hash[index]["eng_ioliste"] = calc_tot(anz_devices, grobengineering.device.eng_ioliste)
        @hash[index]["eng_elplanung"] = calc_tot(anz_devices, grobengineering.device.eng_elplanung)
        @hash[index]["eng_fktbeschrieb"] = calc_tot(anz_devices, grobengineering.device.eng_fktbeschrieb)
        @hash[index]["eng_safetymatrix"] = calc_tot(anz_devices, grobengineering.device.eng_safetymatrix)
        @hash[index]["eng_software"] = (calc_tot(anz_devices, grobengineering.device.eng_software))+ grobengineering.funktion_sw.to_f
        @hash[index]["eng_softwaresafety"] = calc_tot(anz_devices, grobengineering.device.eng_softwaresafety)
        @hash[index]["eng_bauleitung"] = calc_tot(anz_devices, grobengineering.device.eng_bauleitung)
        @hash[index]["eng_parametrierung"] = calc_tot(anz_devices, grobengineering.device.eng_parametrierung)
        @hash[index]["eng_signaltest"] = calc_tot(anz_devices, grobengineering.device.eng_signaltest)
        @hash[index]["eng_safetytest"] = calc_tot(anz_devices, grobengineering.device.eng_safetytest)
        @hash[index]["eng_fkttestkalt"] = calc_tot(anz_devices, grobengineering.device.eng_fkttestkalt)
        @hash[index]["eng_fkttestheiss"] = calc_tot(anz_devices, grobengineering.device.eng_fkttestheiss) + (0.3*grobengineering.funktion_sw.to_f)
        @hash[index]["eng_konformitaet"] = calc_tot(anz_devices, grobengineering.device.eng_konformitaet)
        @hash[index]["ger_beschriftung"] = calc_tot(anz_devices, grobengineering.device.ger_beschriftung)
        @hash[index]["ger_sensor"] = calc_tot(anz_devices, grobengineering.device.ger_sensor)
        @hash[index]["ger_ventil"] = calc_tot(anz_devices, grobengineering.device.ger_ventil)
        @hash[index]["ger_heizung"] = calc_tot(anz_devices, grobengineering.device.ger_heizung)
        @hash[index]["ger_m1r"] = calc_tot(anz_devices, grobengineering.device.ger_m1r)
        @hash[index]["ger_m2r"] = calc_tot(anz_devices, grobengineering.device.ger_m2r)
        @hash[index]["ger_mfu"] = calc_tot(anz_devices, grobengineering.device.ger_mfu)
        @hash[index]["ger_wicklung"] = calc_tot(anz_devices, grobengineering.device.ger_wicklung)
        @hash[index]["ger_bremse"] = calc_tot(anz_devices, grobengineering.device.ger_bremse)
        @hash[index]["ger_geraeteheizung"] = calc_tot(anz_devices, grobengineering.device.ger_geraeteheizung)
        @hash[index]["ger_kommunikation"] = calc_tot(anz_devices, grobengineering.device.ger_kommunikation)
        @hash[index]["ger_safety"] = calc_tot(anz_devices, grobengineering.device.ger_safety)
        @hash[index]["ger_spsmodul"] = calc_tot(anz_devices, grobengineering.device.ger_spsmodul)
        @hash[index]["sig_di"] = calc_tot(anz_devices, grobengineering.device.sig_di)
        @hash[index]["sig_do"] = calc_tot(anz_devices, grobengineering.device.sig_do)
        @hash[index]["sig_ai"] = calc_tot(anz_devices, grobengineering.device.sig_ai)
        @hash[index]["sig_ao"] = calc_tot(anz_devices, grobengineering.device.sig_ao)
        @hash[index]["sig_z"] = calc_tot(anz_devices, grobengineering.device.sig_z)
        @hash[index]["sig_inkr"] = calc_tot(anz_devices, grobengineering.device.sig_inkr)
        @hash[index]["sig_ssi"] = calc_tot(anz_devices, grobengineering.device.sig_ssi)
        @hash[index]["sig_pb"] = calc_tot(anz_devices, grobengineering.device.sig_pb)
        @hash[index]["sig_sdi"] = calc_tot(anz_devices, grobengineering.device.sig_sdi)
        @hash[index]["sig_sdo"] = calc_tot(anz_devices, grobengineering.device.sig_sdo)
        @hash[index]["sig_sai"] = calc_tot(anz_devices, grobengineering.device.sig_sai)
        @hash[index]["sig_sao"] = calc_tot(anz_devices, grobengineering.device.sig_sao)
        if grobengineering.device.ger_spsmodul != 0
          baugruppe = Assembly.where(:kennung => grobengineering.device.definition).first
          @hash[index]["sps_beschreibung"] = baugruppe.bezeichnung
          @hash[index]["sps_artikel"] = baugruppe.artikelnr
          @hash[index]["sps_di"] = baugruppe.di
          @hash[index]["sps_do"] = baugruppe.do
          @hash[index]["sps_ai"] = baugruppe.ai
          @hash[index]["sps_ao"] = baugruppe.ao
          @hash[index]["sps_zaehler"] = baugruppe.z
          @hash[index]["sps_inkr"] = baugruppe.inkr
          @hash[index]["sps_ssi"] = baugruppe.ssi
          @hash[index]["sps_sdi"] = baugruppe.sdi
          @hash[index]["sps_sdo"] = baugruppe.sdo
          @hash[index]["sps_sai"] = baugruppe.sai
          @hash[index]["sps_sao"] = baugruppe.sao
        else
          @hash[index]["sps_beschreibung"] = ''
        end

        @hash[index]["sch_einbau"] = grobengineering.device.switchgear_einbau.nil? ? '' :
            grobengineering.device.switchgear_einbau.kennung
        @hash[index]["sch_einbau_laenge"] = calc_tot(anz_devices, grobengineering.device.sch_anzahl)
        @hash[index]["wire_steuerung"] = grobengineering.device.wire_steuerung.nil? ? '' :
                                         grobengineering.device.wire_steuerung.kabeltyp
        @hash[index]["wire_steuerung_laenge"] = calc_tot(anz_devices, grobengineering.device.kabelsteuerunglaenge)
        @hash[index]["wire_speisung"] = grobengineering.device.wire_speisung.nil? ? '' :
                                             grobengineering.device.wire_speisung.kabeltyp
        @hash[index]["wire_speisung_laenge"] = calc_tot(anz_devices, grobengineering.device.kabelspeisunglaenge)
        @hash[index]["wire_potausgleich"] = grobengineering.device.wire_potausgleich.nil? ? '' :
                                             grobengineering.device.wire_potausgleich.kabeltyp
        @hash[index]["wire_potausgleich_laenge"] = calc_tot(anz_devices, grobengineering.device.kabelpotausgleichlaenge)
        @hash[index]["wire_spez1_laenge_tot"] = calc_tot(anz_devices, grobengineering.kabel_spez1_laenge)
        @hash[index]["wire_spez2_laenge_tot"] = calc_tot(anz_devices, grobengineering.kabel_spez2_laenge)
        @hash[index]["wire_spez3_laenge_tot"] = calc_tot(anz_devices, grobengineering.kabel_spez3_laenge)
        @hash[index]["elinst_trasse"] = grobengineering.device.elinst_trasse.nil? ? '' :
                                            grobengineering.device.elinst_trasse.kennung
        @hash[index]["elinst_trasse_laenge"] = calc_tot(anz_devices, grobengineering.device.installationtrasselaenge)
        @hash[index]["elinst_rohr"] = grobengineering.device.elinst_rohr.nil? ? '' :
                                            grobengineering.device.elinst_rohr.kennung
        @hash[index]["elinst_rohr_laenge"] = calc_tot(anz_devices, grobengineering.device.installationrohrlaenge)
        @hash[index]["elinst_geraete"] = grobengineering.device.elinst_geraete.nil? ? '' :
                                            grobengineering.device.elinst_geraete.kennung
        @hash[index]["elinst_geraete_laenge"] = calc_tot(anz_devices, grobengineering.device.installationgeraetelaenge)
        @hash[index]["kosten_eng_admin"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_admin,
                                                           @hash[index]["eng_admin"])
        @hash[index]["kosten_eng_steuerkonzept"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_steuerkonzept,
                                                           @hash[index]["eng_steuerkonzept"])
        @hash[index]["kosten_eng_ioliste"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_ioliste,
                                                           @hash[index]["eng_ioliste"])
        @hash[index]["kosten_eng_elplanung"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_elplanung,
                                                           @hash[index]["eng_elplanung"])
        @hash[index]["kosten_eng_fktbeschrieb"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_fktbeschrieb,
                                                           @hash[index]["eng_fktbeschrieb"])
        @hash[index]["kosten_eng_safetymatrix"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_safetymatrix,
                                                           @hash[index]["eng_safetymatrix"])
        @hash[index]["kosten_eng_software"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_software,
                                                           @hash[index]["eng_software"])
        @hash[index]["kosten_eng_softwaresafety"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_softwaresafety,
                                                           @hash[index]["kosten_eng_softwaresafety"])
        @hash[index]["kosten_eng_bauleitung"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_bauleitung,
                                                           @hash[index]["eng_bauleitung"])
        @hash[index]["kosten_eng_parametrierung"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_parametrierung,
                                                           @hash[index]["eng_parametrierung"])
        @hash[index]["kosten_eng_signaltest"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_signaltest,
                                                           @hash[index]["eng_signaltest"])
        @hash[index]["kosten_eng_safetytest"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_safetytest,
                                                           @hash[index]["eng_safetytest"])
        @hash[index]["kosten_eng_fkttestkalt"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_fkttestkalt,
                                                           @hash[index]["eng_fkttestkalt"])
        @hash[index]["kosten_eng_fkttestheiss"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_fkttestheiss,
                                                           @hash[index]["eng_fkttestheiss"])
        @hash[index]["kosten_eng_konformitaet"] = calc_kosten_tot(grobengineering.subsubproject.hourrate_konformitaet,
                                                           @hash[index]["eng_konformitaet"])
        @hash[index]["kosten_eng_elplanung_total"] = @hash[index]["kosten_eng_elplanung"]
        @hash[index]["kosten_eng_planung_sw_total"] =
            @hash[index]["kosten_eng_admin"].to_f +
            @hash[index]["kosten_eng_steuerkonzept"].to_f +
            @hash[index]["kosten_eng_ioliste"].to_f +
            @hash[index]["kosten_eng_fktbeschrieb"].to_f +
            @hash[index]["kosten_eng_safetymatrix"].to_f +
            @hash[index]["kosten_eng_software"].to_f +
            @hash[index]["kosten_eng_software_safety"].to_f +
            @hash[index]["kosten_eng_konformitaet"].to_f
        @hash[index]["kosten_eng_ibn_bauleitung_total"] =
            @hash[index]["kosten_eng_bauleitung"].to_f +
            @hash[index]["kosten_eng_parametrierung"].to_f +
            @hash[index]["kosten_eng_signaltest"].to_f +
            @hash[index]["kosten_eng_safetytest"].to_f +
            @hash[index]["kosten_eng_fkttestkalt"].to_f +
            @hash[index]["kosten_eng_fkttestheiss"].to_f

        if grobengineering.device.ger_spsmodul != 0
          @hash[index]["kosten_sps_total_brutto"] =
              Assembly.where(:kennung => grobengineering.device.definition).first.brutto_chf_col(eurokurs)
          @hash[index]["kosten_sps_total_netto"] =
              Assembly.where(:kennung => grobengineering.device.definition).first.netto(eurokurs)
        else
          @hash[index]["kosten_sps_total_brutto"] = 0
          @hash[index]["kosten_sps_total_netto"] = 0
        end

        if !proiorechnen
          @hash[index]["kosten_io_et_total_brutto"] =
              (@hash[index]["sig_di"].to_f * Assembly.di_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_do"].to_f * Assembly.do_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_ai"].to_f * Assembly.ai_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_ao"].to_f * Assembly.ao_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_z"].to_f * Assembly.z_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_inkr"].to_f * Assembly.inkr_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_ssi"].to_f * Assembly.ssi_brutto_chf(eurokurs))
          @hash[index]["kosten_io_et_total_netto"] =
              (@hash[index]["sig_di"].to_f * Assembly.di_netto_chf(eurokurs)) +
                  (@hash[index]["sig_do"].to_f * Assembly.do_netto_chf(eurokurs)) +
                  (@hash[index]["sig_ai"].to_f * Assembly.ai_netto_chf(eurokurs)) +
                  (@hash[index]["sig_ao"].to_f * Assembly.ao_netto_chf(eurokurs)) +
                  (@hash[index]["sig_z"].to_f * Assembly.z_netto_chf(eurokurs)) +
                  (@hash[index]["sig_inkr"].to_f * Assembly.inkr_netto_chf(eurokurs)) +
                  (@hash[index]["sig_ssi"].to_f * Assembly.ssi_netto_chf(eurokurs))
          @hash[index]["kosten_io_pilz_total_brutto"] =
              (@hash[index]["sig_sdi"].to_f * Assembly.sdi_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_sdo"].to_f * Assembly.sdo_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_sai"].to_f * Assembly.sai_brutto_chf(eurokurs)) +
                  (@hash[index]["sig_sao"].to_f * Assembly.sao_brutto_chf(eurokurs))
          @hash[index]["kosten_io_pilz_total_netto"] =
              (@hash[index]["sig_sdi"].to_f * Assembly.sdi_netto_chf(eurokurs)) +
                  (@hash[index]["sig_sdo"].to_f * Assembly.sdo_netto_chf(eurokurs)) +
                  (@hash[index]["sig_sai"].to_f * Assembly.sai_netto_chf(eurokurs)) +
                  (@hash[index]["sig_sao"].to_f * Assembly.sao_netto_chf(eurokurs))
        else
          @hash[index]["kosten_io_et_total_brutto"] = 0
          @hash[index]["kosten_io_et_total_netto"] = 0
          @hash[index]["kosten_io_pilz_total_brutto"] = 0
          @hash[index]["kosten_io_pilz_total_netto"] = 0
        end

        if !grobengineering.fu_typ.nil?
          @hash[index]["kosten_fu_einzel_brutto"] = grobengineering.fu_typ.brutto
          @hash[index]["kosten_fu_einzel_netto"] = grobengineering.fu_typ.netto
          @hash[index]["kosten_fu_total_brutto"] = anz_devices * @hash[index]["kosten_fu_einzel_brutto"].to_f
          @hash[index]["kosten_fu_total_netto"] = anz_devices * @hash[index]["kosten_fu_einzel_netto"].to_f
        else
          @hash[index]["kosten_fu_einzel_brutto"] = 0
          @hash[index]["kosten_fu_einzel_netto"] = 0
          @hash[index]["kosten_fu_total_brutto"] = 0
          @hash[index]["kosten_fu_total_netto"] = 0
        end

        if !grobengineering.switchgear_motorenabgang.nil?
          @hash[index]["kosten_sch_abgaenge_brutto"] = anz_devices * grobengineering.switchgear_motorenabgang.brutto
          @hash[index]["kosten_sch_abgaenge_netto"] = anz_devices * grobengineering.switchgear_motorenabgang.netto
        else
          @hash[index]["kosten_sch_abgaenge_brutto"] = 0
          @hash[index]["kosten_sch_abgaenge_netto"] = 0
        end

        if !grobengineering.device.switchgear_einbau.nil?
          @hash[index]["kosten_sch_einbau_brutto"] = anz_devices * grobengineering.device.sch_anzahl.to_f *
              grobengineering.device.switchgear_einbau.brutto
          @hash[index]["kosten_sch_einbau_netto"] = anz_devices * grobengineering.device.sch_anzahl.to_f *
              grobengineering.device.switchgear_einbau.netto
        else
          @hash[index]["kosten_sch_einbau_brutto"] = 0
          @hash[index]["kosten_sch_einbau_netto"] = 0
        end
        @hash[index]["kosten_sch_total_brutto"] = @hash[index]["kosten_sch_abgaenge_brutto"].to_f +
            @hash[index]["kosten_sch_einbau_brutto"].to_f
        @hash[index]["kosten_sch_total_netto"] = @hash[index]["kosten_sch_abgaenge_netto"].to_f +
            @hash[index]["kosten_sch_einbau_netto"].to_f



        if !grobengineering.device.wire_steuerung.nil?
          wiresupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'}).first
          wirecaptionsupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'}).first
          wire = grobengineering.device.wire_steuerung
          wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
          @hash[index]["kosten_wire_steuerung_total"] = @hash[index]["wire_steuerung_laenge"] * wire_trasse +
              anz_devices * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
        else
          @hash[index]["kosten_wire_steuerung_total"] = 0
        end

        if !grobengineering.device.wire_speisung.nil?
          wiresupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'}).first
          wirecaptionsupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'}).first
          wire = grobengineering.device.wire_speisung
          wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
          @hash[index]["kosten_wire_speisung_total"] = @hash[index]["wire_speisung_laenge"] * wire_trasse +
              anz_devices * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
        else
          @hash[index]["kosten_wire_speisung_total"] = 0
        end

        if !grobengineering.device.wire_potausgleich.nil?
          wiresupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'}).first
          wirecaptionsupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'}).first
          wire = grobengineering.device.wire_potausgleich
          wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
          @hash[index]["kosten_wire_potausgleich_total"] = @hash[index]["wire_potausgleich_laenge"] * wire_trasse +
              anz_devices * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
        else
          @hash[index]["kosten_wire_potausgleich_total"] = 0
        end

        if !grobengineering.wire_spez1.nil?
          wiresupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'}).first
          wirecaptionsupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'}).first
          wire = grobengineering.wire_spez1
          wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
          @hash[index]["kosten_wire_spez1_total"] = @hash[index]["wire_spez1_laenge_tot"] * wire_trasse +
              anz_devices * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
        else
          @hash[index]["kosten_wire_spez1_total"] = 0
        end

        if !grobengineering.wire_spez2.nil?
          wiresupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'}).first
          wirecaptionsupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'}).first
          wire = grobengineering.wire_spez2
          wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
          @hash[index]["kosten_wire_spez2_total"] = @hash[index]["wire_spez2_laenge_tot"] * wire_trasse +
              anz_devices * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
        else
          @hash[index]["kosten_wire_spez2_total"] = 0
        end

        if !grobengineering.wire_spez3.nil?
          wiresupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'}).first
          wirecaptionsupplier = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabelbeschriftung'}).first
          wire = grobengineering.wire_spez3
          wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
          @hash[index]["kosten_wire_spez3_total"] = @hash[index]["wire_spez3_laenge_tot"] * wire_trasse +
              anz_devices * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
        else
          @hash[index]["kosten_wire_spez3_total"] = 0
        end

        if !grobengineering.device.elinst_trasse.nil?
          @hash[index]["kosten_elinst_trasse_total_brutto"] = grobengineering.device.installationtrasselaenge * grobengineering.device.elinst_trasse.brutto
          @hash[index]["kosten_elinst_trasse_total_netto"] = grobengineering.device.installationtrasselaenge * grobengineering.device.elinst_trasse.netto
        else
          @hash[index]["kosten_elinst_trasse_total_brutto"] = 0
          @hash[index]["kosten_elinst_trasse_total_netto"] = 0
        end

        if !grobengineering.device.elinst_rohr.nil?
          @hash[index]["kosten_elinst_rohr_total_brutto"] = grobengineering.device.installationrohrlaenge * grobengineering.device.elinst_rohr.brutto
          @hash[index]["kosten_elinst_rohr_total_netto"] = grobengineering.device.installationrohrlaenge * grobengineering.device.elinst_rohr.netto
        else
          @hash[index]["kosten_elinst_rohr_total_brutto"] = 0
          @hash[index]["kosten_elinst_rohr_total_netto"] = 0
        end

        if !grobengineering.device.elinst_geraete.nil?
          @hash[index]["kosten_elinst_geraete_total_brutto"] = grobengineering.device.installationgeraetelaenge * grobengineering.device.elinst_geraete.brutto
          @hash[index]["kosten_elinst_geraete_total_netto"] = grobengineering.device.installationgeraetelaenge * grobengineering.device.elinst_geraete.netto
        else
          @hash[index]["kosten_elinst_geraete_total_brutto"] = 0
          @hash[index]["kosten_elinst_geraete_total_netto"] = 0
        end

        @hash[index]["kosten_geraetebeschriftung_total_brutto"] = @hash[index]["ger_beschriftung"].to_f * ElectricalInstallation.geraetebeschriftung_brutto
        @hash[index]["kosten_geraetebeschriftung_total_netto"] = @hash[index]["ger_beschriftung"].to_f * ElectricalInstallation.geraetebeschriftung_netto

        @hash[index]["kosten_elinst_total_brutto"] =
            @hash[index]["kosten_wire_steuerung_total"] +
            @hash[index]["kosten_wire_speisung_total"] +
            @hash[index]["kosten_wire_potausgleich_total"] +
            @hash[index]["kosten_wire_spez1_total"] +
            @hash[index]["kosten_wire_spez2_total"] +
            @hash[index]["kosten_wire_spez3_total"] +
            @hash[index]["kosten_elinst_trasse_total_brutto"] +
            @hash[index]["kosten_elinst_rohr_total_brutto"] +
            @hash[index]["kosten_elinst_geraete_total_brutto"]

        @hash[index]["kosten_elinst_total_netto"] =
            @hash[index]["kosten_wire_steuerung_total"] +
            @hash[index]["kosten_wire_speisung_total"] +
            @hash[index]["kosten_wire_potausgleich_total"] +
            @hash[index]["kosten_wire_spez1_total"] +
            @hash[index]["kosten_wire_spez2_total"] +
            @hash[index]["kosten_wire_spez3_total"] +
            @hash[index]["kosten_elinst_trasse_total_netto"] +
            @hash[index]["kosten_elinst_rohr_total_netto"] +
            @hash[index]["kosten_elinst_geraete_total_netto"]

        @hash[index]["kosten_total_brutto"] =
            @hash[index]["kosten_eng_elplanung_total"] +
                @hash[index]["kosten_eng_planung_sw_total"] +
                @hash[index]["kosten_eng_ibn_bauleitung_total"] +
                @hash[index]["kosten_sps_total_brutto"] +
                @hash[index]["kosten_io_et_total_brutto"] +
                @hash[index]["kosten_io_pilz_total_brutto"] +
                @hash[index]["kosten_fu_total_brutto"] +
                @hash[index]["kosten_sch_total_brutto"] +
                @hash[index]["kosten_elinst_total_brutto"]

        @hash[index]["kosten_total_netto"] =
            @hash[index]["kosten_eng_elplanung_total"] +
            @hash[index]["kosten_eng_planung_sw_total"] +
            @hash[index]["kosten_eng_ibn_bauleitung_total"] +
            @hash[index]["kosten_sps_total_netto"] +
            @hash[index]["kosten_io_et_total_netto"] +
            @hash[index]["kosten_io_pilz_total_netto"] +
            @hash[index]["kosten_fu_total_netto"] +
            @hash[index]["kosten_sch_total_netto"] +
            @hash[index]["kosten_elinst_total_netto"]
      end
    end
=end