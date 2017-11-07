class DriveSupplier < ApplicationRecord
  belongs_to :drive
  validates :drive, :presence => true
  belongs_to :supplier
  validates :supplier, :presence => true

  validates :drive, uniqueness:  { scope: :supplier_id,
                                        message: " mit diesem Lieferant bereits vergeben." }

  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}

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
        if DriveSupplier.where(:drive_id => new_record[:drive_id],
                                                :supplier_id => new_record[:supplier_id]).any?
          # if this device already exists, only update existing entry
          existing_record = DriveSupplier.where(:drive_id => new_record[:drive_id],
                                                                 :supplier_id => new_record[:supplier_id]).first
          existing_record.assign_attributes(new_record)
          suppliertypeid = Suppliertype.where(name: 'FU').first.id
          if existing_record.valid? && SupplierSuppliertype.where(:supplier_id => existing_record.supplier_id, :suppliertype_id => suppliertypeid).any?
            records_to_update << existing_record
          else
            return 'Import konnte nicht durchgeführt werden!'
          end
        else
          suppliertypeid = Suppliertype.where(name: 'FU').first.id
          if DriveSupplier.new(new_record).valid? && SupplierSuppliertype.where(:supplier_id => new_record[:supplier_id], :suppliertype_id => suppliertypeid).any?
            records_to_save << new_record
          else
            return 'Import konnte nicht durchgeführt werden!'
          end
        end
      end
      records_to_save.each do |record|
        DriveSupplier.create! record
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
