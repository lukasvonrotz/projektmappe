class Info < ApplicationRecord
  belongs_to :subproject
  validates :subproject, :presence => true
end
