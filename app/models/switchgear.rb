class Switchgear < ApplicationRecord
  validates :maxstrom, numericality: {only_float: true, allow_blank: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}

  has_many :switchgearcombinations, dependent: :destroy

  def netto
    return self.brutto - (self.brutto * self.rabatt)
  end
end
