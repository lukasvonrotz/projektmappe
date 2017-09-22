class Switchgear < ApplicationRecord
  validates :maxstrom, numericality: {only_float: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}

  #delete association in grobengineerings if switchgear is deleted
  has_many :devices, dependent: :nullify

  #delete association in grobengineerings if switchgear is deleted
  has_many :grobengineerings, dependent: :nullify

  has_many :switchgearcombinations, dependent: :destroy
end
