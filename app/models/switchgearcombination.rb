class Switchgearcombination < ApplicationRecord
  belongs_to :switchgear
  has_many :iogroups
end
