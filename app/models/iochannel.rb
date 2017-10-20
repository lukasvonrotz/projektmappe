class Iochannel < ApplicationRecord
  belongs_to :iogroupcomponent
  validates :iogroupcomponent, :presence => true

  has_one :iosignal

  validates :kanalnummer, presence:true, numericality: {only_integer: true}
  validates :kanalnummer, uniqueness:  { scope: [:channeltype, :iogroupcomponent_id],
                                  message: " in Kombination mit Signaltyp ist bereits vergeben."}

  # CSV Export
  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.order(:id).each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

  def address
   self.iogroupcomponent.iogroup.address_prefix.to_s + '.' + self.iogroupcomponent.iogroup.profibus_address.to_s + '.'  +
       self.iogroupcomponent.steckplatznummer.to_s + '.' +  self.kanalnummer.to_s + '.' + self.address_suffix.to_s + ' ('+ self.channeltype + ')'
  end
end
