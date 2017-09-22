class Iogroup < ApplicationRecord
  belongs_to :switchgearcombination
  belongs_to :iotype

  has_and_belongs_to_many :assemblies
end
