class Offertposition < ApplicationRecord
  belongs_to :subsubproject
  validates :subsubproject, :presence => true
end
