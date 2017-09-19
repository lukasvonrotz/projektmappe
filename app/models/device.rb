class Device < ApplicationRecord
  has_many :device_wires, dependent: :destroy
  has_many :wires, :through => :device_wires

  has_many :device_electrical_installations, dependent: :destroy
  has_many :electrical_installations, :through => :device_electrical_installations

  belongs_to :switchgear, optional: true
end
