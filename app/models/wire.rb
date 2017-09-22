class Wire < ApplicationRecord
  has_many :wire_suppliers, dependent: :destroy
  has_many :suppliers, :through => :wire_suppliers

  has_many :device_wires, dependent: :destroy
  has_many :devices, :through => :device_wires

  #delete association in grobengineerings if wire is deleted
  has_many :grobengineerings, dependent: :nullify
end
