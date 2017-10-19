class Iosignal < ApplicationRecord
  belongs_to :iochannel

  belongs_to :grobengineering
  validates :grobengineering, :presence => true

  #delete all associated iosignalenginfos if iosignal is deleted
  has_many :iosignalenginfos, dependent: :destroy

  #delete all associated iosignalibninfos if iosignal is deleted
  has_many :iosignalibninfos, dependent: :destroy

  validates :signal_ana_range_min, numericality: {only_float: true, :presence => true}
  validates :signal_ana_range_max, numericality: {only_float: true, :presence => true}
  validates :signal_ana_range_decimals, numericality: {only_integer: true, :presence => true}
  validates :bus, numericality: {only_integer: true, :presence => true}
  validates :di, numericality: {only_integer: true, :presence => true}
  validates :do, numericality: {only_integer: true, :presence => true}
  validates :ai, numericality: {only_integer: true, :presence => true}
  validates :ao, numericality: {only_integer: true, :presence => true}
  validates :z, numericality: {only_integer: true, :presence => true}
  validates :inkr, numericality: {only_integer: true, :presence => true}
  validates :ssi, numericality: {only_integer: true, :presence => true}
  validates :safety, numericality: {only_integer: true, :presence => true}
  validates :ex, numericality: {only_integer: true, :presence => true}

  def tagname
    'tagname'
  end

end