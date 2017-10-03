class Grobengineering < ApplicationRecord

  #include helper where class methods are defined
  include GrobengineeringsHelper

  belongs_to :subsubproject

  belongs_to :subsystem, optional: true
  belongs_to :iogroup, optional: true
  belongs_to :drive, optional: true
  belongs_to :device

  belongs_to :switchgear_motorenabgang, :class_name => 'Switchgear', :foreign_key => 'switchgear_motorenabgang_id', :optional => true
  belongs_to :fu_typ, :class_name => 'Drive', :foreign_key => 'fu_typ_id', :optional => true
  belongs_to :wire_spez1, :class_name => 'Wire', :foreign_key => 'wire_spez1_id', :optional => true
  belongs_to :wire_spez2, :class_name => 'Wire', :foreign_key => 'wire_spez2_id', :optional => true
  belongs_to :wire_spez3, :class_name => 'Wire', :foreign_key => 'wire_spez3_id', :optional => true

  def strom_total
    return calc_tot(self.device_anzahl, self.strom)
  end

  # Engineering
  def eng_admin
    return calc_tot(self.device_anzahl, self.device.eng_admin)
  end
  def eng_steuerkonzept
    return calc_tot(self.device_anzahl, self.device.eng_steuerkonzept)
  end
  def eng_ioliste
    return calc_tot(self.device_anzahl, self.device.eng_ioliste)
  end
  def eng_elplanung
    return calc_tot(self.device_anzahl, self.device.eng_elplanung)
  end
  def eng_fktbeschrieb
    return calc_tot(self.device_anzahl, self.device.eng_fktbeschrieb)
  end
  def eng_safetymatrix
    return calc_tot(self.device_anzahl, self.device.eng_safetymatrix)
  end
  def eng_software
    return calc_tot(self.device_anzahl, self.device.eng_software) + self.funktion_sw.to_f
  end
  def eng_softwaresafety
    return calc_tot(self.device_anzahl, self.device.eng_softwaresafety)
  end
  def eng_bauleitung
    return calc_tot(self.device_anzahl, self.device.eng_bauleitung)
  end
  def eng_parametrierung
    return calc_tot(self.device_anzahl, self.device.eng_parametrierung)
  end
  def eng_signaltest
    return calc_tot(self.device_anzahl, self.device.eng_signaltest)
  end
  def eng_safetytest
    return calc_tot(self.device_anzahl, self.device.eng_safetytest)
  end
  def eng_fkttestkalt
    return calc_tot(self.device_anzahl, self.device.eng_fkttestkalt)
  end
  def eng_fkttestheiss
    return calc_tot(self.device_anzahl, self.device.eng_fkttestheiss) + (0.3*self.funktion_sw.to_f)
  end
  def eng_konformitaet
    return calc_tot(self.device_anzahl, self.device.eng_konformitaet)
  end

  # Geräte
  def ger_beschriftung
    return calc_tot(self.device_anzahl, self.device.ger_beschriftung)
  end
  def ger_sensor
    return calc_tot(self.device_anzahl, self.device.ger_sensor)
  end
  def ger_ventil
    return calc_tot(self.device_anzahl, self.device.ger_ventil)
  end
  def ger_heizung
    return calc_tot(self.device_anzahl, self.device.ger_heizung)
  end
  def ger_m1r
    return calc_tot(self.device_anzahl, self.device.ger_m1r)
  end
  def ger_m2r
    return calc_tot(self.device_anzahl, self.device.ger_m2r)
  end
  def ger_mfu
    return calc_tot(self.device_anzahl, self.device.ger_mfu)
  end
  def ger_wicklung
    return calc_tot(self.device_anzahl, self.device.ger_wicklung)
  end
  def ger_bremse
    return calc_tot(self.device_anzahl, self.device.ger_bremse)
  end
  def ger_geraeteheizung
    return calc_tot(self.device_anzahl, self.device.ger_geraeteheizung)
  end
  def ger_kommunikation
    return calc_tot(self.device_anzahl, self.device.ger_kommunikation)
  end
  def ger_safety
    return calc_tot(self.device_anzahl, self.device.ger_safety)
  end
  def ger_spsmodul
    return calc_tot(self.device_anzahl, self.device.ger_spsmodul)
  end

  # Signale
  def sig_di
    return calc_tot(self.device_anzahl, self.device.sig_di)
  end
  def sig_do
    return calc_tot(self.device_anzahl, self.device.sig_do)
  end
  def sig_ai
    return calc_tot(self.device_anzahl, self.device.sig_ai)
  end
  def sig_ao
    return calc_tot(self.device_anzahl, self.device.sig_ao)
  end
  def sig_z
    return calc_tot(self.device_anzahl, self.device.sig_z)
  end
  def sig_inkr
    return calc_tot(self.device_anzahl, self.device.sig_inkr)
  end
  def sig_ssi
    return calc_tot(self.device_anzahl, self.device.sig_ssi)
  end
  def sig_pb
    return calc_tot(self.device_anzahl, self.device.sig_pb)
  end
  def sig_sdi
    return calc_tot(self.device_anzahl, self.device.sig_sdi)
  end
  def sig_sdo
    return calc_tot(self.device_anzahl, self.device.sig_sdo)
  end
  def sig_sai
    return calc_tot(self.device_anzahl, self.device.sig_sai)
  end
  def sig_sao
    return calc_tot(self.device_anzahl, self.device.sig_sao)
  end

  # SPS
  def sps_beschreibung
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.bezeichnung
    else
      return ''
    end
  end
  def sps_artikel
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.artikelnr
    else
      return ''
    end
  end
  def sps_di
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.di
    else
      return 0
    end
  end
  def sps_do
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.do
    else
      return 0
    end
  end
  def sps_ai
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.ai
    else
      return 0
    end
  end
  def sps_ao
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.ao
    else
      return 0
    end
  end
  def sps_zaehler
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.z
    else
      return 0
    end
  end
  def sps_inkr
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.inkr
    else
      return 0
    end
  end
  def sps_ssi
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.ssi
    else
      return 0
    end
  end
  def sps_sdi
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.sdi
    else
      return 0
    end
  end
  def sps_sdo
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.sdo
    else
      return 0
    end
  end
  def sps_sai
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.sai
    else
      return 0
    end
  end
  def sps_sao
    if self.device.ger_spsmodul != 0
      baugruppe = Assembly.where(:kennung => self.device.definition).first
      return baugruppe.sao
    else
      return 0
    end
  end

  # Schaltanlagen Einbau
  def sch_einbau
    if !self.device.switchgear_einbau.nil?
      return self.device.switchgear_einbau.kennung
    else
      return ''
    end
  end
  def sch_einbau_laenge
    return calc_tot(self.device_anzahl, self.device.sch_anzahl)
  end

  # Elektroinstallation
  def wire_steuerung
    if !self.device.wire_steuerung.nil?
      return self.device.wire_steuerung.kabeltyp
    else
      return ''
    end
  end
  def wire_steuerung_laenge
    return calc_tot(self.device_anzahl, self.device.kabelsteuerunglaenge.to_f)
  end
  def wire_speisung
    if !self.device.wire_speisung.nil?
      return self.device.wire_speisung.kabeltyp
    else
      return ''
    end
  end
  def wire_speisung_laenge
    return calc_tot(self.device_anzahl, self.device.kabelspeisunglaenge.to_f)
  end
  def wire_potausgleich
    if !self.device.wire_potausgleich.nil?
      return self.device.wire_potausgleich.kabeltyp
    else
      return ''
    end
  end
  def wire_potausgleich_laenge
    return calc_tot(self.device_anzahl, self.device.kabelpotausgleichlaenge.to_f)
  end
  def wire_spez1_laenge_tot
    return calc_tot(self.device_anzahl, self.kabel_spez1_laenge.to_f)
  end
  def wire_spez2_laenge_tot
    return calc_tot(self.device_anzahl, self.kabel_spez2_laenge.to_f)
  end
  def wire_spez3_laenge_tot
    return calc_tot(self.device_anzahl, self.kabel_spez3_laenge.to_f)
  end

  def elinst_trasse
    if !self.device.elinst_trasse.nil?
      return self.device.elinst_trasse.kennung
    else
      return ''
    end
  end
  def elinst_trasse_laenge
    return calc_tot(self.device_anzahl, self.device.installationtrasselaenge)
  end
  def elinst_rohr
    if !self.device.elinst_rohr.nil?
      return self.device.elinst_rohr.kennung
    else
      return ''
    end
  end
  def elinst_rohr_laenge
    return calc_tot(self.device_anzahl, self.device.installationrohrlaenge)
  end
  def elinst_geraete
    if !self.device.elinst_geraete.nil?
      return self.device.elinst_geraete.kennung
    else
      return ''
    end
  end
  def elinst_geraete_laenge
    return calc_tot(self.device_anzahl, self.device.installationgeraetelaenge)
  end

  # Kosten Engineering
  def kosten_eng_admin
    return calc_kosten_tot(self.subsubproject.hourrate_admin, self.eng_admin)
  end
  def kosten_eng_steuerkonzept
    return calc_kosten_tot(self.subsubproject.hourrate_steuerkonzept, self.eng_steuerkonzept)
  end
  def kosten_eng_ioliste
    return calc_kosten_tot(self.subsubproject.hourrate_ioliste, self.eng_ioliste)
  end
  def kosten_eng_elplanung
    return calc_kosten_tot(self.subsubproject.hourrate_elplanung, self.eng_elplanung)
  end
  def kosten_eng_fktbeschrieb
    return calc_kosten_tot(self.subsubproject.hourrate_fktbeschrieb, self.eng_fktbeschrieb)
  end
  def kosten_eng_safetymatrix
    return calc_kosten_tot(self.subsubproject.hourrate_safetymatrix, self.eng_safetymatrix)
  end
  def kosten_eng_software
    return calc_kosten_tot(self.subsubproject.hourrate_software, self.eng_software)
  end
  def kosten_eng_softwaresafety
    return calc_kosten_tot(self.subsubproject.hourrate_softwaresafety, self.eng_softwaresafety)
  end
  def kosten_eng_bauleitung
    return calc_kosten_tot(self.subsubproject.hourrate_bauleitung, self.eng_bauleitung)
  end
  def kosten_eng_parametrierung
    return calc_kosten_tot(self.subsubproject.hourrate_parametrierung, self.eng_parametrierung)
  end
  def kosten_eng_signaltest
    return calc_kosten_tot(self.subsubproject.hourrate_signaltest, self.eng_signaltest)
  end
  def kosten_eng_safetytest
    return calc_kosten_tot(self.subsubproject.hourrate_safetytest, self.eng_safetytest)
  end
  def kosten_eng_fkttestkalt
    return calc_kosten_tot(self.subsubproject.hourrate_fkttestkalt, self.eng_fkttestkalt)
  end
  def kosten_eng_fkttestheiss
    return calc_kosten_tot(self.subsubproject.hourrate_fkttestheiss, self.eng_fkttestheiss)
  end
  def kosten_eng_konformitaet
    return calc_kosten_tot(self.subsubproject.hourrate_konformitaet, self.eng_konformitaet)
  end

  def kosten_eng_elplanung_total
    return self.kosten_eng_elplanung
  end
  def kosten_eng_planung_sw_total
    return (self.kosten_eng_admin +
      self.kosten_eng_steuerkonzept +
      self.kosten_eng_ioliste +
      self.kosten_eng_fktbeschrieb +
      self.kosten_eng_safetymatrix +
      self.kosten_eng_software +
      self.kosten_eng_softwaresafety +
      self.kosten_eng_konformitaet)
  end
  def kosten_eng_ibn_bauleitung_total
    return (self.kosten_eng_bauleitung +
        self.kosten_eng_parametrierung +
        self.kosten_eng_signaltest +
        self.kosten_eng_safetytest +
        self.kosten_eng_fkttestkalt +
        self.kosten_eng_fkttestheiss)
  end

  # Kosten SPS
  def kosten_sps_total_brutto(eurokurs)
    if self.device.ger_spsmodul != 0
      return Assembly.where(:kennung => self.device.definition).first.brutto_chf_col(eurokurs)
    else
      return 0
    end
  end
  def kosten_sps_total_netto(eurokurs)
    if self.device.ger_spsmodul != 0
      return Assembly.where(:kennung => self.device.definition).first.netto(eurokurs)
    else
      return 0
    end
  end

  # Kosten IO
  def kosten_io_et_total_brutto(pro_io_rechnen, eurokurs)
    if !pro_io_rechnen
      total = (self.sig_di * Assembly.di_brutto_chf(eurokurs)) +
        (self.sig_do * Assembly.do_brutto_chf(eurokurs)) +
        (self.sig_ai * Assembly.ai_brutto_chf(eurokurs)) +
        (self.sig_ao * Assembly.ao_brutto_chf(eurokurs)) +
        (self.sig_z * Assembly.z_brutto_chf(eurokurs)) +
        (self.sig_inkr * Assembly.inkr_brutto_chf(eurokurs)) +
        (self.sig_ssi * Assembly.ssi_brutto_chf(eurokurs))
      return total
    else
      return 0
    end
  end
  def kosten_io_et_total_netto(pro_io_rechnen, eurokurs)
    if !pro_io_rechnen
      total = (self.sig_di * Assembly.di_netto_chf(eurokurs)) +
        (self.sig_do * Assembly.do_netto_chf(eurokurs)) +
        (self.sig_ai * Assembly.ai_netto_chf(eurokurs)) +
        (self.sig_ao * Assembly.ao_netto_chf(eurokurs)) +
        (self.sig_z * Assembly.z_netto_chf(eurokurs)) +
        (self.sig_inkr * Assembly.inkr_netto_chf(eurokurs)) +
        (self.sig_ssi * Assembly.ssi_netto_chf(eurokurs))
      return total
    else
      return 0
    end
  end
  def kosten_io_pilz_total_brutto(pro_io_rechnen, eurokurs)
    if !pro_io_rechnen
      total = (self.sig_sdi * Assembly.sdi_brutto_chf(eurokurs)) +
          (self.sig_sdo * Assembly.sdo_brutto_chf(eurokurs)) +
          (self.sig_sai * Assembly.sai_brutto_chf(eurokurs)) +
          (self.sig_sao * Assembly.sao_brutto_chf(eurokurs))
      return total
    else
      return 0
    end
  end
  def kosten_io_pilz_total_netto(pro_io_rechnen, eurokurs)
    if !pro_io_rechnen
      total = (self.sig_sdi * Assembly.sdi_netto_chf(eurokurs)) +
        (self.sig_sdo * Assembly.sdo_netto_chf(eurokurs)) +
        (self.sig_sai * Assembly.sai_netto_chf(eurokurs)) +
        (self.sig_sao * Assembly.sao_netto_chf(eurokurs))
      return total
    else
      return 0
    end
  end

  # Kosten FU
  def kosten_fu_einzel_brutto
    if !self.fu_typ.nil?
      return self.fu_typ.brutto
    else
      return 0
    end
  end
  def kosten_fu_einzel_netto
    if !self.fu_typ.nil?
      return self.fu_typ.netto
    else
      return 0
    end
  end
  def kosten_fu_total_brutto
    calc_tot(self.device_anzahl, self.kosten_fu_einzel_brutto)
  end
  def kosten_fu_total_netto
    calc_tot(self.device_anzahl, self.kosten_fu_einzel_netto)
  end

  # Kosten Schaltanlagen
  def kosten_sch_abgaenge_brutto
    if !self.switchgear_motorenabgang.nil?
      return calc_tot(self.device_anzahl, self.switchgear_motorenabgang.brutto)
    else
      return 0
    end
  end
  def kosten_sch_abgaenge_netto
    if !self.switchgear_motorenabgang.nil?
      return calc_tot(self.device_anzahl, self.switchgear_motorenabgang.netto)
    else
      return 0
    end
  end
  def kosten_sch_einbau_brutto
    if !self.device.switchgear_einbau.nil?
      return calc_tot(self.device_anzahl * self.device.sch_anzahl, self.device.switchgear_einbau.brutto)
    else
      return 0
    end
  end
  def kosten_sch_einbau_netto
    if !self.device.switchgear_einbau.nil?
      return calc_tot(self.device_anzahl * self.device.sch_anzahl, self.device.switchgear_einbau.netto)
    else
      return 0
    end
  end
  def kosten_sch_total_brutto
    total = self.kosten_sch_abgaenge_brutto + self.kosten_sch_einbau_brutto
    return total
  end
  def kosten_sch_total_netto
    total = self.kosten_sch_abgaenge_netto + self.kosten_sch_einbau_netto
    return total
  end

  # Kosten Elektroinstallation
  def kosten_wire_steuerung_total(wiresupplier, wirecaptionsupplier)
    if !self.device.wire_steuerung.nil?
      wire = self.device.wire_steuerung
      wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
      total = self.wire_steuerung_laenge * wire_trasse +
          self.device_anzahl * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
      return total
    else
      return 0
    end
  end
  def kosten_wire_speisung_total(wiresupplier, wirecaptionsupplier)
    if !self.device.wire_speisung.nil?
      wire = self.device.wire_speisung
      wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
      total = self.wire_speisung_laenge * wire_trasse +
          self.device_anzahl * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
      return total
    else
      return 0
    end
  end
  def kosten_wire_potausgleich_total(wiresupplier, wirecaptionsupplier)
    if !self.device.wire_potausgleich.nil?
      wire = self.device.wire_potausgleich
      wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
      total = self.wire_potausgleich_laenge * wire_trasse +
          self.device_anzahl * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
      return total
    else
      return 0
    end
  end
  def kosten_wire_spez1_total(wiresupplier, wirecaptionsupplier)
    if !self.wire_spez1.nil?
      wire = self.wire_spez1
      wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
      total = self.wire_spez1_laenge_tot * wire_trasse +
          self.device_anzahl * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
      return total
    else
      return 0
    end
  end
  def kosten_wire_spez2_total(wiresupplier, wirecaptionsupplier)
    if !self.wire_spez2.nil?
      wire = self.wire_spez2
      wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
      total = self.wire_spez2_laenge_tot * wire_trasse +
          self.device_anzahl * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
      return total
    else
      return 0
    end
  end
  def kosten_wire_spez3_total(wiresupplier, wirecaptionsupplier)
    if !self.wire_spez3.nil?
      wire = self.wire_spez3
      wire_trasse = WireSupplier.where(:wire_id => wire.id, :supplier_id => wiresupplier.id).first.installationtrasse
      total = self.wire_spez3_laenge_tot * wire_trasse +
          self.device_anzahl * wire.anschluesse_total(wiresupplier, wirecaptionsupplier)
      return total
    else
      return 0
    end
  end
  def kosten_elinst_trasse_total_brutto
    if !self.device.elinst_trasse.nil?
      return self.device.installationtrasselaenge * self.device.elinst_trasse.brutto
    else
      return 0
    end
  end
  def kosten_elinst_trasse_total_netto
    if !self.device.elinst_trasse.nil?
      return self.device.installationtrasselaenge * self.device.elinst_trasse.netto
    else
      return 0
    end
  end
  def kosten_elinst_rohr_total_brutto
    if !self.device.elinst_rohr.nil?
      return self.device.installationrohrlaenge * self.device.elinst_rohr.brutto
    else
      return 0
    end
  end
  def kosten_elinst_rohr_total_netto
    if !self.device.elinst_rohr.nil?
      return self.device.installationrohrlaenge * self.device.elinst_rohr.netto
    else
      return 0
    end
  end
  def kosten_elinst_geraete_total_brutto
    if !self.device.elinst_geraete.nil?
      return self.device.installationgeraetelaenge * self.device.elinst_geraete.brutto
    else
      return 0
    end
  end
  def kosten_elinst_geraete_total_netto
    if !self.device.elinst_geraete.nil?
      return self.device.installationgeraetelaenge * self.device.elinst_geraete.netto
    else
      return 0
    end
  end
  def kosten_geraetebeschriftung_total_brutto
    return self.ger_beschriftung * ElectricalInstallation.geraetebeschriftung_brutto
  end
  def kosten_geraetebeschriftung_total_netto
    return self.ger_beschriftung * ElectricalInstallation.geraetebeschriftung_netto
  end


  def kosten_elinst_total_brutto(wiresupplier, wirecaptionsupplier)
    total = self.kosten_wire_steuerung_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_speisung_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_potausgleich_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_spez1_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_spez2_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_spez3_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_elinst_trasse_total_brutto +
      self.kosten_elinst_rohr_total_brutto +
      self.kosten_elinst_geraete_total_brutto
    return total
  end

  def kosten_elinst_total_netto(wiresupplier, wirecaptionsupplier)
    total = self.kosten_wire_steuerung_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_speisung_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_potausgleich_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_spez1_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_spez2_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_wire_spez3_total(wiresupplier, wirecaptionsupplier) +
      self.kosten_elinst_trasse_total_netto +
      self.kosten_elinst_rohr_total_netto +
      self.kosten_elinst_geraete_total_netto
    return total
  end

  def kosten_total_brutto(wiresupplier, wirecaptionsupplier, pro_io_rechnen, eurokurs)
    total = self.kosten_eng_elplanung_total +
      self.kosten_eng_planung_sw_total +
      self.kosten_eng_ibn_bauleitung_total +
      self.kosten_sps_total_brutto(eurokurs) +
      self.kosten_io_et_total_brutto(pro_io_rechnen, eurokurs) +
      self.kosten_io_pilz_total_brutto(pro_io_rechnen, eurokurs) +
      self.kosten_fu_total_brutto +
      self.kosten_sch_total_brutto +
      self.kosten_elinst_total_brutto(wiresupplier, wirecaptionsupplier)
    return total
  end

  def kosten_total_netto(wiresupplier, wirecaptionsupplier, pro_io_rechnen, eurokurs)
    total = self.kosten_eng_elplanung_total +
      self.kosten_eng_planung_sw_total +
      self.kosten_eng_ibn_bauleitung_total +
      self.kosten_sps_total_netto(eurokurs) +
      self.kosten_io_et_total_netto(pro_io_rechnen, eurokurs) +
      self.kosten_io_pilz_total_netto(pro_io_rechnen, eurokurs) +
      self.kosten_fu_total_netto +
      self.kosten_sch_total_netto +
      self.kosten_elinst_total_netto(wiresupplier, wirecaptionsupplier)
    return total
  end


  private

  def calc_tot(anz_devices, attribute)
    if attribute.nil?
      return 0
    else
      return anz_devices * attribute.to_f
    end
  end
  def calc_kosten_tot(hourrate, single)
    if single.nil? or hourrate.nil?
      return 0
    else
      return hourrate.to_f * single.to_f
    end
  end
end
