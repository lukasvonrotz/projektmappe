class Assembly < ApplicationRecord
  validates :kanaele, numericality: {only_integer: true}
  validates :brutto_eur, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}

  has_and_belongs_to_many :iogroups
end
