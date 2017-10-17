class Device < ApplicationRecord

  require 'csv'

  validates :definition, uniqueness: true
  validates :eng_admin, presence:true, numericality: {only_float: true}
  validates :eng_steuerkonzept, presence:true, numericality: {only_float: true}
  validates :eng_ioliste, presence:true, numericality: {only_float: true}
  validates :eng_elplanung, presence:true, numericality: {only_float: true}
  validates :eng_fktbeschrieb, presence:true, numericality: {only_float: true}
  validates :eng_safetymatrix, presence:true, numericality: {only_float: true}
  validates :eng_software, presence:true, numericality: {only_float: true}
  validates :eng_softwaresafety, presence:true, numericality: {only_float: true}
  validates :eng_bauleitung, presence:true, numericality: {only_float: true}
  validates :eng_parametrierung, presence:true, numericality: {only_float: true}
  validates :eng_signaltest, presence:true, numericality: {only_float: true}
  validates :eng_safetytest, presence:true, numericality: {only_float: true}
  validates :eng_fkttestkalt, presence:true, numericality: {only_float: true}
  validates :eng_fkttestheiss, presence:true, numericality: {only_float: true}
  validates :eng_konformitaet, presence:true, numericality: {only_float: true}
  validates :ger_beschriftung, presence:true, numericality: {only_integer: true}
  validates :ger_sensor, presence:true, numericality: {only_integer: true}
  validates :ger_ventil, presence:true, numericality: {only_integer: true}
  validates :ger_heizung, presence:true, numericality: {only_integer: true}
  validates :ger_m1r, presence:true, numericality: {only_integer: true}
  validates :ger_m2r, presence:true, numericality: {only_integer: true}
  validates :ger_mfu, presence:true, numericality: {only_integer: true}
  validates :ger_wicklung, presence:true, numericality: {only_integer: true}
  validates :ger_bremse, presence:true, numericality: {only_integer: true}
  validates :ger_geraeteheizung, presence:true, numericality: {only_integer: true}
  validates :ger_kommunikation, presence:true, numericality: {only_integer: true}
  validates :ger_safety, presence:true, numericality: {only_integer: true}
  validates :ger_spsmodul, presence:true, numericality: {only_integer: true}
  validates :sig_di, presence:true, numericality: {only_integer: true}
  validates :sig_do, presence:true, numericality: {only_integer: true}
  validates :sig_ai, presence:true, numericality: {only_integer: true}
  validates :sig_ao, presence:true, numericality: {only_integer: true}
  validates :sig_z, presence:true, numericality: {only_integer: true}
  validates :sig_inkr, presence:true, numericality: {only_integer: true}
  validates :sig_ssi, presence:true, numericality: {only_integer: true}
  validates :sig_pb, presence:true, numericality: {only_integer: true}
  validates :sig_sdi, presence:true, numericality: {only_integer: true}
  validates :sig_sdo, presence:true, numericality: {only_integer: true}
  validates :sig_sai, presence:true, numericality: {only_integer: true}
  validates :sig_sao, presence:true, numericality: {only_integer: true}
  validates :sch_anzahl, presence:true, numericality: {only_integer: true}
  validates :kabelsteuerunglaenge, presence:true, numericality: {only_float: true}
  validates :kabelspeisunglaenge, presence:true, numericality: {only_float: true}
  validates :kabelpotausgleichlaenge, presence:true, numericality: {only_float: true}
  validates :installationtrasselaenge, presence:true, numericality: {only_float: true}
  validates :installationrohrlaenge, presence:true, numericality: {only_float: true}
  validates :installationgeraetelaenge, presence:true, numericality: {only_float: true}



  belongs_to :switchgear_einbau, :class_name => 'Switchgear', :foreign_key => 'switchgear_einbau_id', :optional => true

  belongs_to :wire_steuerung, :class_name => 'Wire', :foreign_key => 'wire_steuerung_id', :optional => true
  belongs_to :wire_speisung, :class_name => 'Wire', :foreign_key => 'wire_speisung_id', :optional => true
  belongs_to :wire_potausgleich, :class_name => 'Wire', :foreign_key => 'wire_potausgleich_id', :optional => true

  belongs_to :elinst_trasse, :class_name => 'ElectricalInstallation', :foreign_key => 'elinst_trasse_id', :optional => true
  belongs_to :elinst_rohr, :class_name => 'ElectricalInstallation', :foreign_key => 'elinst_rohr_id', :optional => true
  belongs_to :elinst_geraete, :class_name => 'ElectricalInstallation', :foreign_key => 'elinst_geraete_id', :optional => true

  #delete association in grobengineerings if device is deleted
  has_many :grobengineerings, dependent: :nullify

  def self.import(file)
    records_to_save = []
    records_to_update = []
    begin
      CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
        new_record = row.to_hash.except(:id)
        if Device.where(:definition => new_record[:definition]).any?
          # if this device already exists, only update existing entry
          existing_record = Device.where(:definition => new_record[:definition]).first
          existing_record.assign_attributes(new_record)
          if existing_record.valid?
            records_to_update << existing_record
          else
            return 'Bitte Eintrag mit Kennung ' + existing_record[:definition] + ' überprüfen!'
          end
        else
          if Device.new(new_record).valid?
            records_to_save << new_record
          else
            return 'Bitte Eintrag mit Definition ' + new_record[:definition] + ' überprüfen!'
          end
        end
      end
      records_to_save.each do |record|
        Device.create! record
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

  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def select_without columns
    select(column_names - columns.map(&:to_s))
  end

end
