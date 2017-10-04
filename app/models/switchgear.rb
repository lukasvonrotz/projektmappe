class Switchgear < ApplicationRecord
  validates :maxstrom, numericality: {only_float: true, allow_blank: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}
  validates :typ, presence:true

  has_many :switchgearcombinations, dependent: :destroy

  def netto
    return self.brutto - (self.brutto * self.rabatt)
  end
end
