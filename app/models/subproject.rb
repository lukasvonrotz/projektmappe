class Subproject < ApplicationRecord
  belongs_to :project
  belongs_to :customer
  has_many :subproject_users, :dependent => :destroy
  has_many :users, :through => :subproject_users
  has_many :subsubprojects, dependent: :destroy
end
