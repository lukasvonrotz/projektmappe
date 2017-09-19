class DeviceElectricalInstallation < ApplicationRecord
  belongs_to :device
  belongs_to :electrical_installation
end
