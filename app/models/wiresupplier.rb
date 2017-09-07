class Wiresupplier < ApplicationRecord
  has_many :wire_wiresuppliers, dependent: :destroy
  has_many :wires, :through => :wire_wiresuppliers
end
