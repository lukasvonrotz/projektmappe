class Suppliertype < ApplicationRecord
  has_many :supplier_suppliertypes, dependent: :destroy
  has_many :suppliers, :through => :supplier_suppliertypes
end
