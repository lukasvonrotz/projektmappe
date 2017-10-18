class Supplier < ApplicationRecord

  require 'csv'

  has_many :supplier_suppliertypes, dependent: :delete_all
  has_many :suppliertypes, :through => :supplier_suppliertypes

  has_many :wire_suppliers, dependent: :destroy
  has_many :wires, :through => :wire_suppliers

  has_many :wirecaptionprices, dependent: :destroy

  has_many :wire_subsubprojects, class_name: "Subsubproject",
           foreign_key: "wiresupplier_id",
           dependent: :nullify
  has_many :wirecaption_subsubprojects, class_name: "Subsubproject",
           foreign_key: "wirecaptionsupplier_id",
           dependent: :nullify

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
      if Supplier.where(:name => new_record[:name]).any?
        # if this device already exists, only update existing entry
        existing_record = Supplier.where(:name => new_record[:name]).first
        existing_record.assign_attributes(new_record)
        if existing_record.valid?
          records_to_update << existing_record
        else
          return 'Bitte Eintrag mit Name ' + existing_record[:name] + ' überprüfen!'
        end
      else
        if Supplier.new(new_record).valid?
          records_to_save << new_record
        else
          return 'Bitte Eintrag mit Name ' + new_record[:name] + ' überprüfen!'
        end
      end
    end
    records_to_save.each do |record|
      Supplier.create! record
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
