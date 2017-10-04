class WireSupplier < ApplicationRecord
  belongs_to :wire
  validates :wire, :presence => true
  belongs_to :supplier
  validates :supplier, :presence => true

  validates :anschlusstableauseite, presence:true, numericality: {only_float: true}
  validates :anschlussgeraeteseite, presence:true, numericality: {only_float: true}
  validates :beschriftungkabeleinanschluss, presence:true, numericality: {only_float: true}
  validates :beschriftungaderneinanschluss, presence:true, numericality: {only_float: true}
  validates :installationhohlboden, presence:true, numericality: {only_float: true}
  validates :installationtrasse, presence:true, numericality: {only_float: true}
  validates :installationrohr, presence:true, numericality: {only_float: true}
end
