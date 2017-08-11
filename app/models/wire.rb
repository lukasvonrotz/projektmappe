class Wire < ApplicationRecord
  has_many :wire_wiresuppliers
  has_many :wiresuppliers, :through => :wire_wiresuppliers
end
