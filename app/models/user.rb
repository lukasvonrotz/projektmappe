class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :project_users
  has_many :projects, :through => :project_users
  has_many :subproject_users
  has_many :subprojects, :through => :subproject_users

  has_many :offers, dependent: :destroy
end
