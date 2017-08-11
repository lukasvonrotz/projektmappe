class Assembly < ApplicationRecord
  validates :kanaele, numericality: {only_integer: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}
end
