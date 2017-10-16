class ElectricalInstallation < ApplicationRecord

  require 'csv'


  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}

  has_many :elinst_trasse_devices, class_name: "Device",
           foreign_key: "elinst_trasse_id",
           dependent: :nullify
  has_many :elinst_rohr_devices, class_name: "Device",
           foreign_key: "elinst_rohr_id",
           dependent: :nullify
  has_many :elinst_geraete_devices, class_name: "Device",
           foreign_key: "elinst_geraete_id",
           dependent: :nullify

  def netto
    self.brutto - (self.brutto * self.rabatt)
  end

  def self.geraetebeschriftung_brutto
    elinst = ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first
    return elinst.nil? ? 0 : elinst.brutto
  end
  def self.geraetebeschriftung_netto
    elinst = ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first
    return elinst.nil? ? 0 : elinst.netto
  end

  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      begin
        new_record = row.to_hash.except(:id)
        if ElectricalInstallation.where(:kennung => new_record[:kennung]).any?
          # if this device already exists, only update existing entry
          existing_record = ElectricalInstallation.where(:kennung => new_record[:kennung]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          ElectricalInstallation.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end
end
