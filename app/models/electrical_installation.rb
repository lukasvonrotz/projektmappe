class ElectricalInstallation < ApplicationRecord
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, numericality: {only_float: true}

  def netto
    return self.brutto - (self.brutto * self.rabatt)
  end

  def self.geraetebeschriftung_brutto
    return ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first.brutto
  end
  def self.geraetebeschriftung_netto
    return ElectricalInstallation.where(["kennung = ?", "Gerätebeschriftung"]).first.netto
  end
end
