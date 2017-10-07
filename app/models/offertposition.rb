class Offertposition < ApplicationRecord
  belongs_to :subsubproject
  validates :subsubproject, :presence => true

  #delete association in grobengineerings if offertposition is deleted
  has_many :grobengineerings, dependent: :nullify
end
