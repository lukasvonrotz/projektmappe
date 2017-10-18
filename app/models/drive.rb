class Drive < ApplicationRecord

  require 'csv'

  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}
  validates :kennung, uniqueness: true

  #delete association in grobengineerings if drive is deleted
  has_many :fu_typ_grobengineerings, class_name: "Grobengineering",
           foreign_key: "fu_typ_id",
           dependent: :nullify

  def netto
    self.brutto - (self.brutto * self.rabatt)
  end

  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.order(:id).each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def self.import(file)
    records_to_save = []
    records_to_update = []
    begin
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      new_record = row.to_hash.except(:id)
      if Drive.where(:kennung => new_record[:kennung]).any?
        # if this device already exists, only update existing entry
        existing_record = Drive.where(:kennung => new_record[:kennung]).first
        existing_record.assign_attributes(new_record)
        if existing_record.valid?
          records_to_update << existing_record
        else
          return 'Bitte Eintrag mit Kennung ' + existing_record[:kennung] + ' überprüfen!'
        end
      else
        if Drive.new(new_record).valid?
          records_to_save << new_record
        else
          return 'Bitte Eintrag mit Kennung ' + new_record[:kennung] + ' überprüfen!'
        end
      end
    end
    records_to_save.each do |record|
      Drive.create! record
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
