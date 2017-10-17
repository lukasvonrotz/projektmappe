class WireSupplier < ApplicationRecord
  belongs_to :wire
  validates :wire, :presence => true
  belongs_to :supplier
  validates :supplier, :presence => true

  validates :anschlusstableauseite, presence:true, numericality: {only_float: true}
  validates :anschlussgeraeteseite, presence:true, numericality: {only_float: true}
  validates :beschriftungkabeleinanschluss, presence:true, numericality: {only_float: true}
  validates :beschriftungaderneinanschluss, presence:true, numericality: {only_float: true}
  validates :installationhohlboden, presence:true, numericality: {only_float: true}
  validates :installationtrasse, presence:true, numericality: {only_float: true}
  validates :installationrohr, presence:true, numericality: {only_float: true}

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
    records_to_save = []
    records_to_update = []
    begin
      CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
          new_record = row.to_hash.except(:id)
          if WireSupplier.where(:wire_id => new_record[:wire_id],
                                :supplier_id => new_record[:supplier_id]).any?
            # if this device already exists, only update existing entry
            existing_record = WireSupplier.where(:wire_id => new_record[:wire_id],
                                                 :supplier_id => new_record[:supplier_id]).first
            existing_record.assign_attributes(new_record)
            if existing_record.valid?
              records_to_update << existing_record
            else
              return 'Import konnte nicht durchgeführt werden!'
            end
          else
            if WireSupplier.new(new_record).valid?
              records_to_save << new_record
            else
              return 'Import konnte nicht durchgeführt werden!'
            end
          end
      end
      records_to_save.each do |record|
        WireSupplier.create! record
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
