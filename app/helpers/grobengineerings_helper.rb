module GrobengineeringsHelper


  #class methods

  def Grobengineering.device_anzahl(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.device_anzahl end
    return sum
  end
  def Grobengineering.funktion_sw(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.funktion_sw.to_f end
    return sum
  end
  def Grobengineering.kabel_spez1_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kabel_spez1_laenge.to_f end
    return sum
  end
  def Grobengineering.kabel_spez2_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kabel_spez2_laenge.to_f end
    return sum
  end
  def Grobengineering.kabel_spez3_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kabel_spez3_laenge.to_f end
    return sum
  end
  def Grobengineering.leistung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.leistung.to_f end
    return sum
  end
  def Grobengineering.strom_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.strom_total.to_f end
    return sum
  end



  # Engineering
  def Grobengineering.eng_admin(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_admin end
    return sum
  end
  def Grobengineering.eng_steuerkonzept(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_steuerkonzept end
    return sum
  end
  def Grobengineering.eng_ioliste(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_ioliste end
    return sum
  end
  def Grobengineering.eng_elplanung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_elplanung end
    return sum
  end
  def Grobengineering.eng_fktbeschrieb(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_fktbeschrieb end
    return sum
  end
  def Grobengineering.eng_safetymatrix(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_safetymatrix end
    return sum
  end
  def Grobengineering.eng_software(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_software end
    return sum
  end
  def Grobengineering.eng_softwaresafety(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_softwaresafety end
    return sum
  end
  def Grobengineering.eng_bauleitung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_bauleitung end
    return sum
  end
  def Grobengineering.eng_parametrierung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_parametrierung end
    return sum
  end
  def Grobengineering.eng_signaltest(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_signaltest end
    return sum
  end
  def Grobengineering.eng_safetytest(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_safetytest end
    return sum
  end
  def Grobengineering.eng_fkttestkalt(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_fkttestkalt end
    return sum
  end
  def Grobengineering.eng_fkttestheiss(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_fkttestheiss end
    return sum
  end
  def Grobengineering.eng_konformitaet(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.eng_konformitaet end
    return sum
  end

  # Geräte
  def Grobengineering.ger_beschriftung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_beschriftung end
    return sum
  end
  def Grobengineering.ger_sensor(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_sensor end
    return sum
  end
  def Grobengineering.ger_ventil(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_ventil end
    return sum
  end
  def Grobengineering.ger_heizung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_heizung end
    return sum
  end
  def Grobengineering.ger_m1r(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_m1r end
    return sum
  end
  def Grobengineering.ger_m2r(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_m2r end
    return sum
  end
  def Grobengineering.ger_mfu(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_mfu end
    return sum
  end
  def Grobengineering.ger_wicklung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_wicklung end
    return sum
  end
  def Grobengineering.ger_bremse(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_bremse end
    return sum
  end
  def Grobengineering.ger_geraeteheizung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_geraeteheizung end
    return sum
  end
  def Grobengineering.ger_kommunikation(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_kommunikation end
    return sum
  end
  def Grobengineering.ger_safety(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_safety end
    return sum
  end
  def Grobengineering.ger_spsmodul(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.ger_spsmodul end
    return sum
  end

  # Signale
  def Grobengineering.sig_di(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_di end
    return sum
  end
  def Grobengineering.sig_do(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_do end
    return sum
  end
  def Grobengineering.sig_ai(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_ai end
    return sum
  end
  def Grobengineering.sig_ao(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_ao end
    return sum
  end
  def Grobengineering.sig_zaehler(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_z end
    return sum
  end
  def Grobengineering.sig_inkr(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_inkr end
    return sum
  end
  def Grobengineering.sig_ssi(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_ssi end
    return sum
  end
  def Grobengineering.sig_pb(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_pb end
    return sum
  end
  def Grobengineering.sig_sdi(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_sdi end
    return sum
  end
  def Grobengineering.sig_sdo(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_sdo end
    return sum
  end
  def Grobengineering.sig_sai(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_sai end
    return sum
  end
  def Grobengineering.sig_sao(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sig_sao end
    return sum
  end

  # SPS
  def Grobengineering.sps_di(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_di end
    return sum
  end
  def Grobengineering.sps_do(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_do end
    return sum
  end
  def Grobengineering.sps_ai(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_ai end
    return sum
  end
  def Grobengineering.sps_ao(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_ao end
    return sum
  end
  def Grobengineering.sps_zaehler(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_zaehler end
    return sum
  end
  def Grobengineering.sps_inkr(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_inkr end
    return sum
  end
  def Grobengineering.sps_ssi(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_ssi end
    return sum
  end
  def Grobengineering.sps_sdi(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_sdi end
    return sum
  end
  def Grobengineering.sps_sdo(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_sdo end
    return sum
  end
  def Grobengineering.sps_sai(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_sai end
    return sum
  end
  def Grobengineering.sps_sao(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sps_sao end
    return sum
  end

  # Schaltanlagen
  def Grobengineering.sch_einbau_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.sch_einbau_laenge end
    return sum
  end

  # Elektroinstallation
  def Grobengineering.wire_steuerung_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.wire_steuerung_laenge end
    return sum
  end
  def Grobengineering.wire_speisung_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.wire_speisung_laenge end
    return sum
  end
  def Grobengineering.wire_potausgleich_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.wire_potausgleich_laenge end
    return sum
  end
  def Grobengineering.wire_spez1_laenge_tot(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.wire_spez1_laenge_tot end
    return sum
  end
  def Grobengineering.wire_spez2_laenge_tot(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.wire_spez2_laenge_tot end
    return sum
  end
  def Grobengineering.wire_spez3_laenge_tot(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.wire_spez3_laenge_tot end
    return sum
  end
  def Grobengineering.elinst_trasse_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.elinst_trasse_laenge end
    return sum
  end
  def Grobengineering.elinst_rohr_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.elinst_rohr_laenge end
    return sum
  end
  def Grobengineering.elinst_geraete_laenge(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.elinst_geraete_laenge end
    return sum
  end

  def Grobengineering.kosten_eng_admin(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_admin end
    return sum
  end
  def Grobengineering.kosten_eng_steuerkonzept(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_steuerkonzept end
    return sum
  end
  def Grobengineering.kosten_eng_ioliste(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_ioliste end
    return sum
  end
  def Grobengineering.kosten_eng_elplanung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_elplanung end
    return sum
  end
  def Grobengineering.kosten_eng_fktbeschrieb(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_fktbeschrieb end
    return sum
  end
  def Grobengineering.kosten_eng_safetymatrix(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_safetymatrix end
    return sum
  end
  def Grobengineering.kosten_eng_software(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_software end
    return sum
  end
  def Grobengineering.kosten_eng_softwaresafety(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_softwaresafety end
    return sum
  end
  def Grobengineering.kosten_eng_bauleitung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_bauleitung end
    return sum
  end
  def Grobengineering.kosten_eng_parametrierung(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_parametrierung end
    return sum
    end
  def Grobengineering.kosten_eng_signaltest(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_signaltest end
    return sum
  end
  def Grobengineering.kosten_eng_safetytest(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_safetytest end
    return sum
  end
  def Grobengineering.kosten_eng_fkttestkalt(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_fkttestkalt end
    return sum
  end
  def Grobengineering.kosten_eng_fkttestheiss(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_fkttestheiss end
    return sum
  end
  def Grobengineering.kosten_eng_konformitaet(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_konformitaet end
    return sum
  end
  def Grobengineering.kosten_eng_elplanung_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_elplanung_total end
    return sum
  end
  def Grobengineering.kosten_eng_planung_sw_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_planung_sw_total end
    return sum
  end
  def Grobengineering.kosten_eng_ibn_bauleitung_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_eng_ibn_bauleitung_total end
    return sum
  end
  def Grobengineering.kosten_sps_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sps_total_brutto(subsubproject.eurokurs) end
    return sum
  end
  def Grobengineering.kosten_sps_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sps_total_netto(subsubproject.eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_et_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_io_et_total_brutto(subsubproject.proiorechnen, subsubproject.eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_et_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_io_et_total_netto(subsubproject.proiorechnen, subsubproject.eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_pilz_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_io_pilz_total_brutto(subsubproject.proiorechnen, subsubproject.eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_pilz_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_io_pilz_total_netto(subsubproject.proiorechnen, subsubproject.eurokurs) end
    return sum
  end
  def Grobengineering.kosten_fu_einzel_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_fu_einzel_brutto(subsubproject.drivesupplier) end
    return sum
  end
  def Grobengineering.kosten_fu_einzel_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_fu_einzel_netto(subsubproject.drivesupplier) end
    return sum
  end
  def Grobengineering.kosten_fu_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_fu_total_brutto(subsubproject.drivesupplier) end
    return sum
  end
  def Grobengineering.kosten_fu_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_fu_total_netto(subsubproject.drivesupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_abgaenge_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_abgaenge_brutto(subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_abgaenge_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_abgaenge_netto(subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_einbau_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_einbau_brutto(subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_einbau_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_einbau_netto(subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_preisberechnung_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_preisberechnung_brutto(subsubproject.eurokurs, subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_preisberechnung_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_preisberechnung_netto(subsubproject.eurokurs, subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_total_brutto(subsubproject.eurokurs, subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_sch_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_sch_total_netto(subsubproject.eurokurs, subsubproject.switchgearsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_steuerung_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_wire_steuerung_total(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_speisung_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_wire_speisung_total(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_potausgleich_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_wire_potausgleich_total(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_spez1_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_wire_spez1_total(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_spez2_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_wire_spez2_total(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_spez3_total(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_wire_spez3_total(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_trasse_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_trasse_total_brutto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_trasse_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_trasse_total_netto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_rohr_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_rohr_total_brutto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_rohr_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_rohr_total_netto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_geraete_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_geraete_total_brutto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_geraete_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_geraete_total_netto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_geraetebeschriftung_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_geraetebeschriftung_total_brutto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_geraetebeschriftung_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_geraetebeschriftung_total_netto(subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_total_brutto(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier, subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_elinst_total_netto(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier, subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_total_brutto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_total_brutto(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier, subsubproject.proiorechnen, subsubproject.eurokurs, subsubproject.drivesupplier, subsubproject.switchgearsupplier, subsubproject.electricalinstallationsupplier) end
    return sum
  end
  def Grobengineering.kosten_total_netto(subsubproject)
    sum = 0
    Grobengineering.where(:subsubproject_id => subsubproject.id).each do |grobengineering| sum += grobengineering.kosten_total_netto(subsubproject.wiresupplier, subsubproject.wirecaptionsupplier, subsubproject.proiorechnen, subsubproject.eurokurs, subsubproject.drivesupplier, subsubproject.switchgearsupplier, subsubproject.electricalinstallationsupplier) end
    return sum
  end
end
