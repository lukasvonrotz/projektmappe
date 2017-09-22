class Customer < ApplicationRecord

  #delete association in subprojects if customer is deleted
  has_many :subprojects, dependent: :nullify
end
