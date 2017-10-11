class Supplier < ApplicationRecord

  require 'csv'

  has_many :supplier_suppliertypes, dependent: :delete_all
  has_many :suppliertypes, :through => :supplier_suppliertypes

  has_many :wire_suppliers, dependent: :destroy
  has_many :wires, :through => :wire_suppliers

  has_many :wirecaptionprices, dependent: :destroy

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
        if Supplier.where(:name => new_record[:name]).any?
          # if this device already exists, only update existing entry
          existing_record = Supplier.where(:name => new_record[:name]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          Supplier.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end
end
