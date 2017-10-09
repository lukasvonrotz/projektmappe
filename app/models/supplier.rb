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
end
