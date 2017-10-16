class Offer < ApplicationRecord
  has_many :offer_offertpositions, dependent: :destroy
  has_many :offertpositions, :through => :offer_offertpositions

  belongs_to :subsubproject
  validates :subsubproject, :presence => true

  belongs_to :user

  def total_geraeteanzahl
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.device_anzahl
    end
    return total
  end

  def total_eng_elplanung
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.eng_elplanung
    end
    return total
  end

  def total_eng_planung_sw
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.eng_planung_sw
    end
    return total
  end

  def total_eng_ibn_bauleitung
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.eng_ibn_bauleitung
    end
    return total
  end

  def total_sps_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.sps_total_brutto
    end
    return total
  end

  def total_sps_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.sps_total_netto
    end
    return total
  end

  def total_io_et_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.io_et_total_brutto
    end
    return total
  end

  def total_io_et_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.io_et_total_netto
    end
    return total
  end

  def total_io_pilz_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.io_pilz_total_brutto
    end
    return total
  end

  def total_io_pilz_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.io_pilz_total_netto
    end
    return total
  end

  def total_fu_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.fu_total_brutto
    end
    return total
  end

  def total_fu_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.fu_total_netto
    end
    return total
  end

  def total_sch_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.sch_total_brutto
    end
    return total
  end

  def total_sch_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.sch_total_netto
    end
    return total
  end

  def total_elinst_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.elinst_total_brutto
    end
    return total
  end

  def total_elinst_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.elinst_total_netto
    end
    return total
  end

  def total_total_brutto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.total_brutto
    end
    return total
  end

  def total_total_netto
    total = 0
    self.offer_offertpositions.each do |offer_offertposition|
      total += offer_offertposition.total_netto
    end
    return total
  end

end
