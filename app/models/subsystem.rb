class Subsystem < ApplicationRecord
  belongs_to :project
  has_many :units, dependent: :destroy
end
