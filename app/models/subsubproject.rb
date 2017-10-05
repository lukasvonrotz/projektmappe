class Subsubproject < ApplicationRecord
  belongs_to :subproject
  validates :subproject, :presence => true

  belongs_to :wiresupplier, :class_name => 'Supplier', :foreign_key => 'wiresupplier_id'
  validates :wiresupplier, :presence => true
  belongs_to :wirecaptionsupplier, :class_name => 'Supplier', :foreign_key => 'wirecaptionsupplier_id'
  validates :wirecaptionsupplier, :presence => true

  validates :hourrate_admin, presence:true, numericality: {only_float: true}
  validates :hourrate_steuerkonzept, presence:true, numericality: {only_float: true}
  validates :hourrate_ioliste, presence:true, numericality: {only_float: true}
  validates :hourrate_elplanung, presence:true, numericality: {only_float: true}
  validates :hourrate_fktbeschrieb, presence:true, numericality: {only_float: true}
  validates :hourrate_safetymatrix, presence:true, numericality: {only_float: true}
  validates :hourrate_software, presence:true, numericality: {only_float: true}
  validates :hourrate_softwaresafety, presence:true, numericality: {only_float: true}
  validates :hourrate_bauleitung, presence:true, numericality: {only_float: true}
  validates :hourrate_parametrierung, presence:true, numericality: {only_float: true}
  validates :hourrate_signaltest, presence:true, numericality: {only_float: true}
  validates :hourrate_safetytest, presence:true, numericality: {only_float: true}
  validates :hourrate_fkttestkalt, presence:true, numericality: {only_float: true}
  validates :hourrate_fkttestheiss, presence:true, numericality: {only_float: true}
  validates :hourrate_konformitaet, presence:true, numericality: {only_float: true}

  validates :complexity_admin, presence:true, numericality: {only_float: true}
  validates :complexity_steuerkonzept, presence:true, numericality: {only_float: true}
  validates :complexity_ioliste, presence:true, numericality: {only_float: true}
  validates :complexity_elplanung, presence:true, numericality: {only_float: true}
  validates :complexity_fktbeschrieb, presence:true, numericality: {only_float: true}
  validates :complexity_safetymatrix, presence:true, numericality: {only_float: true}
  validates :complexity_software, presence:true, numericality: {only_float: true}
  validates :complexity_softwaresafety, presence:true, numericality: {only_float: true}
  validates :complexity_bauleitung, presence:true, numericality: {only_float: true}
  validates :complexity_parametrierung, presence:true, numericality: {only_float: true}
  validates :complexity_signaltest, presence:true, numericality: {only_float: true}
  validates :complexity_safetytest, presence:true, numericality: {only_float: true}
  validates :complexity_fkttestkalt, presence:true, numericality: {only_float: true}
  validates :complexity_fkttestheiss, presence:true, numericality: {only_float: true}
  validates :complexity_konformitaet, presence:true, numericality: {only_float: true}

  validates :eurokurs, presence:true, numericality: {only_float: true}

  has_many :grobengineerings, dependent: :destroy
end
