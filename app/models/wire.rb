class Wire < ApplicationRecord
  has_many :wire_wiresuppliers, dependent: :delete_all
  has_many :wiresuppliers, :through => :wire_wiresuppliers
end
