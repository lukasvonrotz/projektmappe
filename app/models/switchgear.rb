class Switchgear < ApplicationRecord
  validates :maxstrom, numericality: {only_float: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}
end
