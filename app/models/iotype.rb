class Iotype < ApplicationRecord
  has_many :iogroups, dependent: :nullify
end
