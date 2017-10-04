class Iogroup < ApplicationRecord
  belongs_to :switchgearcombination
  validates :switchgearcombination, :presence => true
  belongs_to :iotype
  validates :iotype, :presence => true

  #delete association in grobengineerings if iogroup is deleted
  has_many :grobengineerings, dependent: :nullify

  has_and_belongs_to_many :assemblies
end
