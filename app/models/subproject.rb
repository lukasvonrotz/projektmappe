class Subproject < ApplicationRecord
  belongs_to :project
  has_many :subsubprojects, dependent: :destroy
end
