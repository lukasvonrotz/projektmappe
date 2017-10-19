class Subproject < ApplicationRecord
  belongs_to :project
  validates :project, :presence => true
  belongs_to :customer
  validates :customer, :presence => true
  has_many :subproject_users, :dependent => :destroy
  has_many :users, :through => :subproject_users
  has_many :subsubprojects, dependent: :destroy
  has_many :histories, dependent: :destroy
  has_many :infos, dependent: :destroy

  validates :max_zeichen_klartext_grobeng, presence:true, numericality: {only_integer: true}
  validates :max_zeichen_klartext_signal, presence:true, numericality: {only_integer: true}
end
