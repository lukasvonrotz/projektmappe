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
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      begin
        new_record = row.to_hash.except(:id)
        if WireSupplier.where(:wire_id => new_record[:wire_id],
                              :supplier_id => new_record[:supplier_id]).any?
          # if this device already exists, only update existing entry
          existing_record = WireSupplier.where(:wire_id => new_record[:wire_id],
                                               :supplier_id => new_record[:supplier_id]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          WireSupplier.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end

end
