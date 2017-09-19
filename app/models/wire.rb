class Wire < ApplicationRecord
  has_many :wire_suppliers, dependent: :destroy
  has_many :suppliers, :through => :wire_suppliers

  has_many :device_wires, dependent: :destroy
  has_many :devices, :through => :device_wires
end
