class OfferOffertposition < ApplicationRecord
  belongs_to :offer
  validates :offer, :presence => true
  belongs_to :offertposition
  validates :offertposition, :presence => true

  validates :device_anzahl, presence:true, numericality: {only_float: true}
  validates :eng_elplanung, presence:true, numericality: {only_float: true}
  validates :eng_planung_sw, presence:true, numericality: {only_float: true}
  validates :eng_ibn_bauleitung, presence:true, numericality: {only_float: true}
  validates :sps_total_brutto, presence:true, numericality: {only_float: true}
  validates :sps_total_netto, presence:true, numericality: {only_float: true}
  validates :sch_total_brutto, presence:true, numericality: {only_float: true}
  validates :sch_total_netto, presence:true, numericality: {only_float: true}
  validates :io_et_total_brutto, presence:true, numericality: {only_float: true}
  validates :io_et_total_netto, presence:true, numericality: {only_float: true}
  validates :io_pilz_total_brutto, presence:true, numericality: {only_float: true}
  validates :io_pilz_total_netto, presence:true, numericality: {only_float: true}
  validates :fu_total_brutto, presence:true, numericality: {only_float: true}
  validates :fu_total_netto, presence:true, numericality: {only_float: true}
  validates :elinst_total_brutto, presence:true, numericality: {only_float: true}
  validates :elinst_total_netto, presence:true, numericality: {only_float: true}

  def total_brutto
    self.eng_elplanung + self.eng_planung_sw + self.eng_ibn_bauleitung + self.sps_total_brutto + self.sch_total_brutto + self.io_et_total_brutto + self.io_pilz_total_brutto + self.fu_total_brutto + self.elinst_total_brutto
  end

  def total_netto
    self.eng_elplanung + self.eng_planung_sw + self.eng_ibn_bauleitung + self.sps_total_netto + self.sch_total_netto + self.io_et_total_netto + self.io_pilz_total_netto + self.fu_total_netto + self.elinst_total_netto
  end
end
