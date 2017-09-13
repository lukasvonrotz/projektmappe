class Wire < ApplicationRecord
  has_many :wire_wiresuppliers, dependent: :delete_all
  has_many :wiresuppliers, :through => :wire_wiresuppliers
  has_many :wire_suppliers, dependent: :destroy
  has_many :suppliers, :through => :wire_suppliers
end
