class ElectricalInstallation < ApplicationRecord

  require 'csv'

  validates :kennung, uniqueness: true

  has_many :electrical_installation_suppliers, dependent: :destroy
  has_many :suppliers, :through => :electrical_installation_suppliers

  has_many :elinst_trasse_devices, class_name: "Device",
           foreign_key: "elinst_trasse_id",
           dependent: :nullify
  has_many :elinst_rohr_devices, class_name: "Device",
           foreign_key: "elinst_rohr_id",
           dependent: :nullify
  has_many :elinst_geraete_devices, class_name: "Device",
           foreign_key: "elinst_geraete_id",
           dependent: :nullify

  def brutto(supplier)
    ElectricalInstallationSupplier.where(["electrical_installation_id = ? and supplier_id = ?", self.id, supplier.id]).first.brutto
  end
  def rabatt(supplier)
    ElectricalInstallationSupplier.where(["electrical_installation_id = ? and supplier_id = ?", self.id, supplier.id]).first.rabatt
  end
  def netto(supplier)
    self.brutto(supplier) - (self.brutto(supplier) * self.rabatt(supplier))
  end

  def self.geraetebeschriftung_brutto(supplier)
    elinst = ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first
    return elinst.nil? ? 0 : elinst.brutto(supplier)
  end
  def self.geraetebeschriftung_netto(supplier)
    elinst = ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first
    return elinst.nil? ? 0 : elinst.netto(supplier)
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
        if ElectricalInstallation.where(:kennung => new_record[:kennung]).any?
          # if this device already exists, only update existing entry
          existing_record = ElectricalInstallation.where(:kennung => new_record[:kennung]).first
          existing_record.assign_attributes(new_record)
          if existing_record.valid?
            records_to_update << existing_record
          else
            return 'Bitte Eintrag mit Kennung ' + existing_record[:kennung] + ' überprüfen!'
          end
        else
          if ElectricalInstallation.new(new_record).valid?
            records_to_save << new_record
          else
            return 'Bitte Eintrag mit Kennung ' + new_record[:kennung] + ' überprüfen!'
          end
        end
      end
      records_to_save.each do |record|
        new_electrical_installation = ElectricalInstallation.create! record
        electricalinstallationsuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Elektroinstallation'})
        electricalinstallationsuppliers.each do |electricalinstallationsupplier|
          electricalInstallationSupplierEntry = ElectricalInstallationSupplier.new
          electricalInstallationSupplierEntry.electrical_installation_id = new_electrical_installation.id
          electricalInstallationSupplierEntry.supplier_id = electricalinstallationsupplier.id
          electricalInstallationSupplierEntry.save!
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
