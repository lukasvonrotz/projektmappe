class ElectricalInstallation < ApplicationRecord
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}

  has_many :device_wires, dependent: :destroy
  has_many :devices, :through => :device_wires
end
