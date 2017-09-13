class Supplier < ApplicationRecord
  has_many :supplier_suppliertypes, dependent: :delete_all
  has_many :suppliertypes, :through => :supplier_suppliertypes

  has_many :wire_suppliers, dependent: :destroy
  has_many :wires, :through => :wire_suppliers

  has_many :wirecaptionprices, dependent: :destroy
end
