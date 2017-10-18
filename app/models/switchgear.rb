class Switchgear < ApplicationRecord

  require 'csv'


  validates :maxstrom, numericality: {only_float: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}
  validates :typ, presence:true
  validates :kennung, uniqueness: true

  has_many :switchgearcombinations, dependent: :destroy

  has_many :motorenabgang_grobengineerings, class_name: "Grobengineering",
           foreign_key: "switchgear_motorenabgang_id",
           dependent: :nullify

  has_many :einbau_devices, class_name: "Device",
           foreign_key: "switchgear_einbau_id",
           dependent: :nullify

  def netto
    self.brutto - (self.brutto * self.rabatt)
  end

  # CSV Export
  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
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
      CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
        new_record = row.to_hash.except(:id)
        if Switchgear.where(:kennung => new_record[:kennung]).any?
          # if this device already exists, only update existing entry
          existing_record = Switchgear.where(:kennung => new_record[:kennung]).first
          existing_record.assign_attributes(new_record)
          if existing_record.valid?
            records_to_update << existing_record
          else
            return 'Bitte Eintrag mit Kennung ' + existing_record[:kennung] + ' überprüfen!'
          end
        else
          if Switchgear.new(new_record).valid?
            records_to_save << new_record
          else
            return 'Bitte Eintrag mit Kennung ' + new_record[:kennung] + ' überprüfen!'
          end
        end
      end
      records_to_save.each do |record|
        Switchgear.create! record
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

end
