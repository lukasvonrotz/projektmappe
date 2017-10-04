class ElectricalInstallation < ApplicationRecord
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}

  def netto
    return self.brutto - (self.brutto * self.rabatt)
  end

  def self.geraetebeschriftung_brutto
    elinst = ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first
    return elinst.nil? ? 0 : elinst.brutto
  end
  def self.geraetebeschriftung_netto
    elinst = ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first
    return elinst.nil? ? 0 : elinst.netto
  end
end
