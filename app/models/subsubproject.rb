class Subsubproject < ApplicationRecord
  belongs_to :subproject

  has_many :grobengineerings, dependent: :destroy
end
