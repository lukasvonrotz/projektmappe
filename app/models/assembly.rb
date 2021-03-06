class Assembly < ApplicationRecord

  require 'csv'

  has_many :iogroupcomponents, dependent: :destroy


  validates :di, numericality: {only_integer: true, :presence => true}
  validates :do, numericality: {only_integer: true, :presence => true}
  validates :ai, numericality: {only_integer: true, :presence => true}
  validates :ao, numericality: {only_integer: true, :presence => true}
  validates :z, numericality: {only_integer: true, :presence => true}
  validates :inkr, numericality: {only_integer: true, :presence => true}
  validates :ssi, numericality: {only_integer: true, :presence => true}
  validates :sdi, numericality: {only_integer: true, :presence => true}
  validates :sdo, numericality: {only_integer: true, :presence => true}
  validates :sai, numericality: {only_integer: true, :presence => true}
  validates :sao, numericality: {only_integer: true, :presence => true}
  validates :brutto_eur, numericality: {only_float: true, :presence => true}
  validates :rabatt, numericality: {only_float: true}
  validates :kennung, uniqueness: true
  validates :kanal_startnummer, numericality: {only_integer: true, :presence => true}


  @@di_anz_bg = 8
  @@di_reserve = 0.2
  @@di_rabatt = 0.3
  @@do_anz_bg = 8
  @@do_reserve = 0.2
  @@do_rabatt = 0.3
  @@ai_anz_bg = 8
  @@ai_reserve = 0.2
  @@ai_rabatt = 0.3
  @@ao_anz_bg = 8
  @@ao_reserve = 0
  @@ao_rabatt = 0.3
  @@z_anz_bg = 8
  @@z_reserve = 0
  @@z_rabatt = 0.3
  @@inkr_anz_bg = 8
  @@inkr_reserve = 0
  @@inkr_rabatt = 0.3
  @@ssi_anz_bg = 8
  @@ssi_reserve = 0
  @@ssi_rabatt = 0.3

  @@sdi_reserve = 0.05
  @@sdi_rabatt = 0.05
  @@sdo_reserve = 0.05
  @@sdo_rabatt = 0.05
  @@sai_reserve = 0
  @@sai_rabatt = 0.05
  @@sao_reserve = 0
  @@sao_rabatt = 0.05

  # CSV Export
  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "iso-8859-1") do |csv|
      csv << attributes

      all.order(:id).each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

  # CSV Import
  def self.import(file)
    records_to_save = []
    records_to_update = []
    begin
      CSV.foreach(file.path, :col_sep => (";"), :encoding => 'iso-8859-1', headers: :first_row, header_converters: :symbol) do |row|
        new_record = row.to_hash.except(:id)
        if Assembly.where(:kennung => new_record[:kennung]).any?
          # if this device already exists, only update existing entry
          existing_record = Assembly.where(:kennung => new_record[:kennung]).first
          existing_record.assign_attributes(new_record)
          if existing_record.valid?
            records_to_update << existing_record
          else
            return 'Bitte Eintrag mit Kennung ' + existing_record[:kennung] + ' überprüfen!'
          end
        else
          if Assembly.new(new_record).valid?
            records_to_save << new_record
          else
            return 'Bitte Eintrag mit Kennung ' + new_record[:kennung] + ' überprüfen!'
          end
        end
      end
      records_to_save.each do |record|
        Assembly.create! record
      end
      records_to_update.each do |record|
        record.save!
      end
      return ''
    rescue Exception => ex
      if file.nil?
        return 'Dateipfad ungültig'
      else
        return ex
      end
    end
  end

  def self.di_anz_bg
    return @@di_anz_bg
  end
  def self.di_reserve
    return @@di_reserve
  end
  def self.di_rabatt
    return @@di_rabatt
  end
  def self.do_anz_bg
    return @@do_anz_bg
  end
  def self.do_reserve
    return @@do_reserve
  end
  def self.do_rabatt
    return @@do_rabatt
  end
  def self.ai_anz_bg
    return @@ai_anz_bg
  end
  def self.ai_reserve
    return @@ai_reserve
  end
  def self.ai_rabatt
    return @@ai_rabatt
  end
  def self.ao_anz_bg
    return @@ao_anz_bg
  end
  def self.ao_reserve
    return @@ao_reserve
  end
  def self.ao_rabatt
    return @@ao_rabatt
  end
  def self.z_anz_bg
    return @@z_anz_bg
  end
  def self.z_reserve
    return @@z_reserve
  end
  def self.z_rabatt
    return @@z_rabatt
  end
  def self.inkr_anz_bg
    return @@inkr_anz_bg
  end
  def self.inkr_reserve
    return @@inkr_reserve
  end
  def self.inkr_rabatt
    return @@inkr_rabatt
  end
  def self.ssi_anz_bg
    return @@ssi_anz_bg
  end
  def self.ssi_reserve
    return @@ssi_reserve
  end
  def self.ssi_rabatt
    return @@ssi_rabatt
  end

  def self.sdi_reserve
    return @@sdi_reserve
  end
  def self.sdi_rabatt
    return @@sdi_rabatt
  end
  def self.sdo_reserve
    return @@sdo_reserve
  end
  def self.sdo_rabatt
    return @@sdo_rabatt
  end
  def self.sai_reserve
    return @@sai_reserve
  end
  def self.sai_rabatt
    return @@sai_rabatt
  end
  def self.sao_reserve
    return @@sao_reserve
  end
  def self.sao_rabatt
    return @@sao_rabatt
  end




  def kanaele_total
    self.di + self.do + self.ai + self.ao + self.z + self.inkr + self.ssi + self.sdi + self.sdo + self.sai + self.sao
  end

  def brutto_chf(eurokurs)
    self.brutto_eur * eurokurs
  end

  def netto(eurokurs)
    self.brutto_chf(eurokurs) - (self.brutto_chf(eurokurs) * self.rabatt)
  end



  def self.validateEntries
    retVal = ""
    if Assembly.where(["kennung = ?", "PB-Stecker"]).empty?
      return "PB-Stecker"
    end
    if Assembly.where(["kennung = ?", "ET200SP 08DI"]).empty?
      return "ET200SP 08DI"
    end
    if Assembly.where(["kennung = ?", "ET200SP 16DI"]).empty?
      return "ET200SP 16DI"
    end
    if Assembly.where(["kennung = ?", "ET200SP 08DO"]).empty?
      return "ET200SP 08DO"
    end
    if Assembly.where(["kennung = ?", "ET200SP 16DO"]).empty?
      return "ET200SP 16DO"
    end
    if Assembly.where(["kennung = ?", "ET200SP 02AI"]).empty?
      return "ET200SP 02AI"
    end
    if Assembly.where(["kennung = ?", "ET200SP 02AO"]).empty?
      return "ET200SP 02AO"
    end
    if Assembly.where(["kennung = ?", "ET200SP Enc INKR"]).empty?
      return "ET200SP Enc INKR"
    end
    if Assembly.where(["kennung = ?", "ET200SP Enc INKR"]).empty?
      return "ET200SP Enc INKR"
    end
    if Assembly.where(["kennung = ?", "ET200SP Base mit U-Vers"]).empty?
      return "ET200SP Base mit U-Vers"
    end
    if Assembly.where(["kennung = ?", "ET200SP Base"]).empty?
      return "ET200SP Base"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti"]).empty?
      return "PNOZmulti"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti Chipcard"]).empty?
      return "PNOZmulti Chipcard"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti Klemm"]).empty?
      return "PNOZmulti Klemm"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti SL"]).empty?
      return "PNOZmulti SL"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti SL Klemm"]).empty?
      return "PNOZmulti SL Klemm"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti PB"]).empty?
      return "PNOZmulti PB"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti 08DI"]).empty?
      return "PNOZmulti 08DI"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti 04DO"]).empty?
      return "PNOZmulti 04DO"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti 01AI"]).empty?
      return "PNOZmulti 01AI"
    end
    if Assembly.where(["kennung = ?", "PNOZmulti 01AO"]).empty?
      return "PNOZmulti 01AO"
    end

    retVal
  end


  def self.preisPbStecker(eurokurs)
    Assembly.where(["kennung = ?", "PB-Stecker"]).first.brutto_chf(eurokurs)
  end
  def self.preisPbBaugruppe(eurokurs)
    Assembly.where(["kennung = ?", "ET200SP PB"]).first.brutto_chf(eurokurs)
  end
  def self.preisBase(eurokurs)
    Assembly.where(["kennung = ?", "ET200SP Base"]).first.brutto_chf(eurokurs)
  end
  def self.preisBaseUvers(eurokurs)
    Assembly.where(["kennung = ?", "ET200SP Base mit U-Vers"]).first.brutto_chf(eurokurs)
  end
  def self.preisIoBaugruppe(eurokurs, baugruppe)
    Assembly.where(["kennung = ?", baugruppe]).first.brutto_chf(eurokurs)
  end
  def self.anzahlKanaeleBaugruppe(baugruppe)
    return Assembly.where(["kennung = ?", baugruppe]).first.kanaele_total
  end

  def self.di_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@di_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP 08DI')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP 08DI')-(@@di_reserve*self.anzahlKanaeleBaugruppe('ET200SP 08DI'))))
    return bruttoChf
  end
  def self.di_netto_chf(eurokurs)
    return self.di_brutto_chf(eurokurs) - (self.di_brutto_chf(eurokurs) * @@di_rabatt)
  end

  def self.do_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@do_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP 08DO')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP 08DO')-(@@do_reserve*self.anzahlKanaeleBaugruppe('ET200SP 08DO'))))
    return bruttoChf
  end
  def self.do_netto_chf(eurokurs)
    return self.do_brutto_chf(eurokurs) - (self.do_brutto_chf(eurokurs) * @@do_rabatt)
  end

  def self.ai_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@ai_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP 02AI')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP 02AI')-(@@ai_reserve*self.anzahlKanaeleBaugruppe('ET200SP 02AI'))))
    return bruttoChf
  end
  def self.ai_netto_chf(eurokurs)
    return self.ai_brutto_chf(eurokurs) - (self.ai_brutto_chf(eurokurs) * @@ai_rabatt)
  end

  def self.ao_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@ao_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP 02AO')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP 02AO')-(@@ao_reserve*self.anzahlKanaeleBaugruppe('ET200SP 02AO'))))

    return bruttoChf
  end
  def self.ao_netto_chf(eurokurs)
    return self.ao_brutto_chf(eurokurs) - (self.ao_brutto_chf(eurokurs) * @@ao_rabatt)
  end

  def self.z_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@z_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP Enc INKR')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP Enc INKR')-(@@z_reserve*self.anzahlKanaeleBaugruppe('ET200SP Enc INKR'))))
    return bruttoChf
  end
  def self.z_netto_chf(eurokurs)
    return self.z_brutto_chf(eurokurs) - (self.z_brutto_chf(eurokurs) * @@z_rabatt)
  end

  def self.inkr_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@inkr_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP Enc INKR')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP Enc INKR')-(@@inkr_reserve*self.anzahlKanaeleBaugruppe('ET200SP Enc INKR'))))
    return bruttoChf
  end
  def self.inkr_netto_chf(eurokurs)
    return self.inkr_brutto_chf(eurokurs) - (self.inkr_brutto_chf(eurokurs) * @@inkr_rabatt)
  end

  def self.ssi_brutto_chf(eurokurs)
    bruttoChf = (self.preisPbStecker(eurokurs) + self.preisPbBaugruppe(eurokurs))/
        @@ssi_anz_bg + ((self.preisIoBaugruppe(eurokurs, 'ET200SP Enc SSI')+((self.preisBaseUvers(eurokurs)+self.preisBase(eurokurs))/2))/
        (self.anzahlKanaeleBaugruppe('ET200SP Enc SSI')-(@@ssi_reserve*self.anzahlKanaeleBaugruppe('ET200SP Enc SSI'))))
    return bruttoChf
  end
  def self.ssi_netto_chf(eurokurs)
    return self.ssi_brutto_chf(eurokurs) - (self.ssi_brutto_chf(eurokurs) * @@ssi_rabatt)
  end



  def self.anzahlKanaelePnozMulti
    return Assembly.where(["kennung = ?", "PNOZmulti"]).first.kanaele_total;
  end
  def self.preisPnozMulti(eurokurs)
    Assembly.where(["kennung = ?", "PNOZmulti"]).first.brutto_chf(eurokurs)
  end
  def self.anzahlKanaelePnozMultiBaugruppe(baugruppe)
    return Assembly.where(["kennung = ?", baugruppe]).first.kanaele_total;
  end
  def self.preisPnozMultiBaugruppe(eurokurs, baugruppe)
    Assembly.where(["kennung = ?", baugruppe]).first.brutto_chf(eurokurs)
  end
  def self.preisPnozMultiChipcard(eurokurs)
    Assembly.where(["kennung = ?", "PNOZmulti Chipcard"]).first.brutto_chf(eurokurs)
  end
  def self.preisPnozMultiKlemm(eurokurs)
    Assembly.where(["kennung = ?", "PNOZmulti Klemm"]).first.brutto_chf(eurokurs)
  end
  def self.preisPnozMultiSl(eurokurs)
    Assembly.where(["kennung = ?", "PNOZmulti SL"]).first.brutto_chf(eurokurs)
  end
  def self.preisPnozMultiSlKlemm(eurokurs)
    Assembly.where(["kennung = ?", "PNOZmulti SL Klemm"]).first.brutto_chf(eurokurs)
  end
  def self.preisPnozMultiPb(eurokurs)
    Assembly.where(["kennung = ?", "PNOZmulti PB"]).first.brutto_chf(eurokurs)
  end

  def self.sdi_brutto_chf(eurokurs)
    bruttoChf = ((self.preisPnozMulti(eurokurs) + self.preisPnozMultiChipcard(eurokurs) +
        self.preisPnozMultiKlemm(eurokurs) + 2*self.preisPnozMultiSl(eurokurs) +
        2*self.preisPnozMultiSlKlemm(eurokurs) + self.preisPnozMultiPb(eurokurs) + self.preisPbStecker(eurokurs)) /
        (self.anzahlKanaelePnozMulti - self.anzahlKanaelePnozMulti*@@sdi_reserve)) +
        (self.preisPnozMultiSlKlemm(eurokurs)+self.preisPnozMultiBaugruppe(eurokurs, 'PNOZmulti 08DI'))/
            (self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 08DI') - self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 08DI')*@@sdi_reserve)
    return bruttoChf
  end
  def self.sdi_netto_chf(eurokurs)
    return self.sdi_brutto_chf(eurokurs) - (self.sdi_brutto_chf(eurokurs) * @@sdi_rabatt)
  end

  def self.sdo_brutto_chf(eurokurs)
    bruttoChf = ((self.preisPnozMulti(eurokurs) + self.preisPnozMultiChipcard(eurokurs) +
        self.preisPnozMultiKlemm(eurokurs) + 2*self.preisPnozMultiSl(eurokurs) +
        2*self.preisPnozMultiSlKlemm(eurokurs) + self.preisPnozMultiPb(eurokurs) + self.preisPbStecker(eurokurs)) /
        (self.anzahlKanaelePnozMulti - self.anzahlKanaelePnozMulti*@@sdo_reserve)) +
        (self.preisPnozMultiSlKlemm(eurokurs)+self.preisPnozMultiBaugruppe(eurokurs, 'PNOZmulti 04DO'))/
            (self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 04DO') - self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 04DO')*@@sdo_reserve)
    return bruttoChf
  end
  def self.sdo_netto_chf(eurokurs)
    return self.sdo_brutto_chf(eurokurs) - (self.sdo_brutto_chf(eurokurs) * @@sdo_rabatt)
  end

  def self.sai_brutto_chf(eurokurs)
    bruttoChf = ((self.preisPnozMulti(eurokurs) + self.preisPnozMultiChipcard(eurokurs) +
        self.preisPnozMultiKlemm(eurokurs) + 2*self.preisPnozMultiSl(eurokurs) +
        2*self.preisPnozMultiSlKlemm(eurokurs) + self.preisPnozMultiPb(eurokurs) + self.preisPbStecker(eurokurs)) /
        (self.anzahlKanaelePnozMulti - self.anzahlKanaelePnozMulti*@@sai_reserve)) +
        (self.preisPnozMultiSlKlemm(eurokurs)+self.preisPnozMultiBaugruppe(eurokurs, 'PNOZmulti 01AI'))/
            (self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 01AI') - self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 01AI')*@@sai_reserve)
    return bruttoChf
  end
  def self.sai_netto_chf(eurokurs)
    return self.sai_brutto_chf(eurokurs) - (self.sai_brutto_chf(eurokurs) * @@sai_rabatt)
  end

  def self.sao_brutto_chf(eurokurs)
    bruttoChf = ((self.preisPnozMulti(eurokurs) + self.preisPnozMultiChipcard(eurokurs) +
        self.preisPnozMultiKlemm(eurokurs) + 2*self.preisPnozMultiSl(eurokurs) +
        2*self.preisPnozMultiSlKlemm(eurokurs) + self.preisPnozMultiPb(eurokurs) + self.preisPbStecker(eurokurs)) /
        (self.anzahlKanaelePnozMulti - self.anzahlKanaelePnozMulti*@@sao_reserve)) +
        (self.preisPnozMultiSlKlemm(eurokurs)+self.preisPnozMultiBaugruppe(eurokurs, 'PNOZmulti 01AO'))/
            (self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 01AO') - self.anzahlKanaelePnozMultiBaugruppe('PNOZmulti 01AO')*@@sao_reserve)
    return bruttoChf
  end
  def self.sao_netto_chf(eurokurs)
    return self.sao_brutto_chf(eurokurs) - (self.sao_brutto_chf(eurokurs) * @@sao_rabatt)
  end
end
