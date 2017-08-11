class ElectricalInstallation < ApplicationRecord
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}
end
