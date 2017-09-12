class Project < ApplicationRecord
  has_many :project_users, :dependent => :destroy
  has_many :users, :through => :project_users
  has_many :subprojects, dependent: :destroy
  has_many :subsystems, dependent: :destroy
end
