class Wire < ApplicationRecord
  has_many :wire_suppliers, dependent: :destroy
  has_many :suppliers, :through => :wire_suppliers

  def anschluesse_ohne_beschriftung(wiresupplier)
    wire_ohne_beschriftung = WireSupplier.where(["wire_id = ? and supplier_id = ?", self.id, wiresupplier.id]).first.anschlusstableauseite +
        WireSupplier.where(["wire_id = ? and supplier_id = ?", self.id, wiresupplier.id]).first.anschlussgeraeteseite
    return wire_ohne_beschriftung
  end

  def beschriftung_total(wiresupplier, wirecaptionsupplier)
    wire_beschriftung_kabel1anschluss = WireSupplier.where(["wire_id = ? and supplier_id = ?", self.id, wiresupplier.id]).first.beschriftungkabeleinanschluss
    wire_beschriftung_adern1anschluss = WireSupplier.where(["wire_id = ? and supplier_id = ?", self.id, wiresupplier.id]).first.beschriftungaderneinanschluss
    wire_beschriftung_total = (2 * wire_beschriftung_kabel1anschluss) +
        (self.aderbeschriftung * wire_beschriftung_adern1anschluss) +
        (2 * Wirecaptionprice.where(:supplier_id => wirecaptionsupplier.id).first.kostenkabelmitmontagetraeger) +
        (self.aderbeschriftung * self.anzahladern * Wirecaptionprice.where(:supplier_id => wirecaptionsupplier.id).first.kostenadermitmontagehuelse)
    return wire_beschriftung_total
  end

  def anschluesse_total(wiresupplier, wirecaptionsupplier)
    return anschluesse_ohne_beschriftung(wiresupplier) + beschriftung_total(wiresupplier, wirecaptionsupplier)
  end

end
