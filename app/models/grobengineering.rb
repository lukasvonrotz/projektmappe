class Grobengineering < ApplicationRecord
  belongs_to :subsubproject

  #fuer kabel spezifisch
  belongs_to :wire, optional: true

  belongs_to :subsystem, optional: true
  belongs_to :switchgear, optional: true
  belongs_to :drive, optional: true
  belongs_to :device
end
