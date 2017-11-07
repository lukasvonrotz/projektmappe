class Iotype < ApplicationRecord

  require 'csv'

  has_many :iogroups, dependent: :nullify

  validates :name, uniqueness: true

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
        if Iotype.where(:name => new_record[:name]).any?
          # if this device already exists, only update existing entry
          existing_record = Iotype.where(:name => new_record[:name]).first
          existing_record.assign_attributes(new_record)
          if existing_record.valid?
            records_to_update << existing_record
          else
            return 'Bitte Eintrag mit Name ' + existing_record[:name] + ' überprüfen!'
          end
        else
          if Iotype.new(new_record).valid?
            records_to_save << new_record
          else
            return 'Bitte Eintrag mit Name ' + new_record[:name] + ' überprüfen!'
          end
        end
      end
      records_to_save.each do |record|
        Iotype.create! record
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
