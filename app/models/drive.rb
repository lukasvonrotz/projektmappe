class Drive < ApplicationRecord
  validates :un, numericality: {only_float: true}
  validates :in, numericality: {only_float: true}
  validates :pn, numericality: {only_float: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}

  #delete association in grobengineerings if drive is deleted
  has_many :grobengineerings, dependent: :nullify

  def netto
    return self.brutto - (self.brutto * self.rabatt)
  end
end
