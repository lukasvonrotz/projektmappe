class Unit < ApplicationRecord
  belongs_to :subsystem
  validates :subsystem, :presence => true
end
