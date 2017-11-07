class Drive < ApplicationRecord

  require 'csv'

  validates :kennung, uniqueness: true

  has_many :drive_suppliers, dependent: :destroy
  has_many :suppliers, :through => :drive_suppliers

  #delete association in grobengineerings if drive is deleted
  has_many :fu_typ_grobengineerings, class_name: "Grobengineering",
           foreign_key: "fu_typ_id",
           dependent: :nullify

  def brutto(supplier)
    DriveSupplier.where(["drive_id = ? and supplier_id = ?", self.id, supplier.id]).first.brutto
  end
  def rabatt(supplier)
    DriveSupplier.where(["drive_id = ? and supplier_id = ?", self.id, supplier.id]).first.rabatt
  end
  def netto(supplier)
    self.brutto(supplier) - (self.brutto(supplier) * self.rabatt(supplier))
  end

  # CSV Export
  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "iso-8859-1") do |csv|
      csv << attributes

      all.order(:id).each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
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
      new_drive = Drive.create! record
      drivesuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'FU'})
      drivesuppliers.each do |drivesupplier|
        driveSupplierEntry = DriveSupplier.new
        driveSupplierEntry.drive_id = new_drive.id
        driveSupplierEntry.supplier_id = drivesupplier.id
        driveSupplierEntry.save!
      end
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
