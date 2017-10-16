class Wire < ApplicationRecord

  require 'csv'


  has_many :wire_suppliers, dependent: :destroy
  has_many :suppliers, :through => :wire_suppliers

  validates :anzahladern, presence:true, numericality: {only_integer: true}

  has_many :wire_spez1_grobengineerings, class_name: "Grobengineering",
           foreign_key: "wire_spez1_id",
           dependent: :nullify
  has_many :wire_spez2_grobengineerings, class_name: "Grobengineering",
           foreign_key: "wire_spez2_id",
           dependent: :nullify
  has_many :wire_spez3_grobengineerings, class_name: "Grobengineering",
           foreign_key: "wire_spez3_id",
           dependent: :nullify

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

  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      begin
        new_record = row.to_hash.except(:id)
        if Wire.where(:kabeltyp => new_record[:kabeltyp]).any?
          # if this device already exists, only update existing entry
          existing_record = Wire.where(:kabeltyp => new_record[:kabeltyp]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          new_wire = Wire.create! new_record
          wiresuppliers = Supplier.joins(:suppliertypes).includes(:suppliertypes).where(:suppliertypes => {:name => 'Kabel'})
          wiresuppliers.each do |wiresupplier|
            wireWiresupplierEntry = WireSupplier.new
            wireWiresupplierEntry.wire_id = new_wire.id
            wireWiresupplierEntry.supplier_id = wiresupplier.id
            wireWiresupplierEntry.save!
          end
        end
      rescue Exception => ex
        return ex
      end
    end
  end

end
