module GrobengineeringsHelper

  @@grobengineerings = Grobengineering.all

  #class methods

  def Grobengineering.device_anzahl
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.device_anzahl end
    return sum
  end
  def Grobengineering.funktion_sw
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.funktion_sw.to_f end
    return sum
  end
  def Grobengineering.kabel_spez1_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kabel_spez1_laenge.to_f end
    return sum
  end
  def Grobengineering.kabel_spez2_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kabel_spez2_laenge.to_f end
    return sum
  end
  def Grobengineering.kabel_spez3_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kabel_spez3_laenge.to_f end
    return sum
  end
  def Grobengineering.leistung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.leistung.to_f end
    return sum
  end
  def Grobengineering.strom_total
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.strom_total.to_f end
    return sum
  end



  # Engineering
  def Grobengineering.eng_admin
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_admin end
    return sum
  end
  def Grobengineering.eng_steuerkonzept
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_steuerkonzept end
    return sum
  end
  def Grobengineering.eng_ioliste
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_ioliste end
    return sum
  end
  def Grobengineering.eng_elplanung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_elplanung end
    return sum
  end
  def Grobengineering.eng_fktbeschrieb
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_fktbeschrieb end
    return sum
  end
  def Grobengineering.eng_safetymatrix
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_safetymatrix end
    return sum
  end
  def Grobengineering.eng_software
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_software end
    return sum
  end
  def Grobengineering.eng_softwaresafety
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_softwaresafety end
    return sum
  end
  def Grobengineering.eng_bauleitung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_bauleitung end
    return sum
  end
  def Grobengineering.eng_parametrierung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_parametrierung end
    return sum
  end
  def Grobengineering.eng_signaltest
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_signaltest end
    return sum
  end
  def Grobengineering.eng_safetytest
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_safetytest end
    return sum
  end
  def Grobengineering.eng_fkttestkalt
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_fkttestkalt end
    return sum
  end
  def Grobengineering.eng_fkttestheiss
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_fkttestheiss end
    return sum
  end
  def Grobengineering.eng_konformitaet
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.eng_konformitaet end
    return sum
  end

  # Geräte
  def Grobengineering.ger_beschriftung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_beschriftung end
    return sum
  end
  def Grobengineering.ger_sensor
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_sensor end
    return sum
  end
  def Grobengineering.ger_ventil
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_ventil end
    return sum
  end
  def Grobengineering.ger_heizung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_heizung end
    return sum
  end
  def Grobengineering.ger_m1r
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_m1r end
    return sum
  end
  def Grobengineering.ger_m2r
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_m2r end
    return sum
  end
  def Grobengineering.ger_mfu
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_mfu end
    return sum
  end
  def Grobengineering.ger_wicklung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_wicklung end
    return sum
  end
  def Grobengineering.ger_bremse
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_bremse end
    return sum
  end
  def Grobengineering.ger_geraeteheizung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_geraeteheizung end
    return sum
  end
  def Grobengineering.ger_kommunikation
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_kommunikation end
    return sum
  end
  def Grobengineering.ger_safety
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_safety end
    return sum
  end
  def Grobengineering.ger_spsmodul
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.ger_spsmodul end
    return sum
  end

  # Signale
  def Grobengineering.sig_di
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_di end
    return sum
  end
  def Grobengineering.sig_do
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_do end
    return sum
  end
  def Grobengineering.sig_ai
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_ai end
    return sum
  end
  def Grobengineering.sig_ao
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_ao end
    return sum
  end
  def Grobengineering.sig_zaehler
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_z end
    return sum
  end
  def Grobengineering.sig_inkr
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_inkr end
    return sum
  end
  def Grobengineering.sig_ssi
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_ssi end
    return sum
  end
  def Grobengineering.sig_pb
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_pb end
    return sum
  end
  def Grobengineering.sig_sdi
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_sdi end
    return sum
  end
  def Grobengineering.sig_sdo
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_sdo end
    return sum
  end
  def Grobengineering.sig_sai
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_sai end
    return sum
  end
  def Grobengineering.sig_sao
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sig_sao end
    return sum
  end

  # SPS
  def Grobengineering.sps_di
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_di end
    return sum
  end
  def Grobengineering.sps_do
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_do end
    return sum
  end
  def Grobengineering.sps_ai
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_ai end
    return sum
  end
  def Grobengineering.sps_ao
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_ao end
    return sum
  end
  def Grobengineering.sps_zaehler
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_zaehler end
    return sum
  end
  def Grobengineering.sps_inkr
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_inkr end
    return sum
  end
  def Grobengineering.sps_ssi
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_ssi end
    return sum
  end
  def Grobengineering.sps_sdi
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_sdi end
    return sum
  end
  def Grobengineering.sps_sdo
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_sdo end
    return sum
  end
  def Grobengineering.sps_sai
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_sai end
    return sum
  end
  def Grobengineering.sps_sao
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sps_sao end
    return sum
  end

  # Schaltanlagen
  def Grobengineering.sch_einbau_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.sch_einbau_laenge end
    return sum
  end

  # Elektroinstallation
  def Grobengineering.wire_steuerung_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.wire_steuerung_laenge end
    return sum
  end
  def Grobengineering.wire_speisung_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.wire_speisung_laenge end
    return sum
  end
  def Grobengineering.wire_potausgleich_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.wire_potausgleich_laenge end
    return sum
  end
  def Grobengineering.wire_spez1_laenge_tot
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.wire_spez1_laenge_tot end
    return sum
  end
  def Grobengineering.wire_spez2_laenge_tot
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.wire_spez2_laenge_tot end
    return sum
  end
  def Grobengineering.wire_spez3_laenge_tot
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.wire_spez3_laenge_tot end
    return sum
  end
  def Grobengineering.elinst_trasse_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.elinst_trasse_laenge end
    return sum
  end
  def Grobengineering.elinst_rohr_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.elinst_rohr_laenge end
    return sum
  end
  def Grobengineering.elinst_geraete_laenge
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.elinst_geraete_laenge end
    return sum
  end

  def Grobengineering.kosten_eng_admin
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_admin end
    return sum
  end
  def Grobengineering.kosten_eng_steuerkonzept
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_steuerkonzept end
    return sum
  end
  def Grobengineering.kosten_eng_ioliste
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_ioliste end
    return sum
  end
  def Grobengineering.kosten_eng_elplanung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_elplanung end
    return sum
  end
  def Grobengineering.kosten_eng_fktbeschrieb
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_fktbeschrieb end
    return sum
  end
  def Grobengineering.kosten_eng_safetymatrix
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_safetymatrix end
    return sum
  end
  def Grobengineering.kosten_eng_software
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_software end
    return sum
  end
  def Grobengineering.kosten_eng_softwaresafety
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_softwaresafety end
    return sum
  end
  def Grobengineering.kosten_eng_bauleitung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_bauleitung end
    return sum
  end
  def Grobengineering.kosten_eng_parametrierung
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_parametrierung end
    return sum
    end
  def Grobengineering.kosten_eng_signaltest
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_signaltest end
    return sum
  end
  def Grobengineering.kosten_eng_safetytest
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_safetytest end
    return sum
  end
  def Grobengineering.kosten_eng_fkttestkalt
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_fkttestkalt end
    return sum
  end
  def Grobengineering.kosten_eng_fkttestheiss
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_fkttestheiss end
    return sum
  end
  def Grobengineering.kosten_eng_konformitaet
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_konformitaet end
    return sum
  end
  def Grobengineering.kosten_eng_elplanung_total
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_elplanung_total end
    return sum
  end
  def Grobengineering.kosten_eng_planung_sw_total
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_planung_sw_total end
    return sum
  end
  def Grobengineering.kosten_eng_ibn_bauleitung_total
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_eng_ibn_bauleitung_total end
    return sum
  end
  def Grobengineering.kosten_sps_total_brutto(eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sps_total_brutto(eurokurs) end
    return sum
  end
  def Grobengineering.kosten_sps_total_netto(eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sps_total_netto(eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_et_total_brutto(proiorechnen, eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_io_et_total_brutto(proiorechnen, eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_et_total_netto(proiorechnen, eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_io_et_total_netto(proiorechnen, eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_pilz_total_netto(proiorechnen, eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_io_pilz_total_netto(proiorechnen, eurokurs) end
    return sum
  end
  def Grobengineering.kosten_io_pilz_total_netto(proiorechnen, eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_io_pilz_total_netto(proiorechnen, eurokurs) end
    return sum
  end
  def Grobengineering.kosten_fu_einzel_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_fu_einzel_brutto end
    return sum
  end
  def Grobengineering.kosten_fu_einzel_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_fu_einzel_netto end
    return sum
  end
  def Grobengineering.kosten_fu_total_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_fu_total_brutto end
    return sum
  end
  def Grobengineering.kosten_fu_total_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_fu_total_netto end
    return sum
  end
  def Grobengineering.kosten_sch_abgaenge_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sch_abgaenge_brutto end
    return sum
  end
  def Grobengineering.kosten_sch_abgaenge_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sch_abgaenge_netto end
    return sum
  end
  def Grobengineering.kosten_sch_einbau_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sch_einbau_brutto end
    return sum
  end
  def Grobengineering.kosten_sch_einbau_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sch_einbau_netto end
    return sum
  end
  def Grobengineering.kosten_sch_total_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sch_total_brutto end
    return sum
  end
  def Grobengineering.kosten_sch_total_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_sch_total_netto end
    return sum
  end
  def Grobengineering.kosten_wire_steuerung_total(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_wire_steuerung_total(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_speisung_total(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_wire_speisung_total(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_potausgleich_total(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_wire_potausgleich_total(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_spez1_total(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_wire_spez1_total(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_spez2_total(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_wire_spez2_total(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_wire_spez3_total(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_wire_spez3_total(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_trasse_total_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_trasse_total_brutto end
    return sum
  end
  def Grobengineering.kosten_elinst_trasse_total_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_trasse_total_netto end
    return sum
  end
  def Grobengineering.kosten_elinst_rohr_total_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_rohr_total_brutto end
    return sum
  end
  def Grobengineering.kosten_elinst_rohr_total_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_rohr_total_netto end
    return sum
  end
  def Grobengineering.kosten_elinst_geraete_total_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_geraete_total_brutto end
    return sum
  end
  def Grobengineering.kosten_elinst_geraete_total_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_geraete_total_netto end
    return sum
  end
  def Grobengineering.kosten_geraetebeschriftung_total_brutto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_geraetebeschriftung_total_brutto end
    return sum
  end
  def Grobengineering.kosten_geraetebeschriftung_total_netto
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_geraetebeschriftung_total_netto end
    return sum
  end
  def Grobengineering.kosten_elinst_total_brutto(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_total_brutto(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_elinst_total_netto(wiresupplier, wirecaptionsupplier)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_elinst_total_netto(wiresupplier, wirecaptionsupplier) end
    return sum
  end
  def Grobengineering.kosten_total_brutto(wiresupplier, wirecaptionsupplier, proiorechnen, eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_total_brutto(wiresupplier, wirecaptionsupplier, proiorechnen, eurokurs) end
    return sum
  end
  def Grobengineering.kosten_total_netto(wiresupplier, wirecaptionsupplier, proiorechnen, eurokurs)
    sum = 0
    @@grobengineerings.each do |grobengineering| sum += grobengineering.kosten_total_netto(wiresupplier, wirecaptionsupplier, proiorechnen, eurokurs) end
    return sum
  end
end
