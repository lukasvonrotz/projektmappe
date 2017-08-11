class Wiresupplier < ApplicationRecord
  has_many :wire_wiresuppliers
  has_many :wires, :through => :wire_wiresuppliers
end
