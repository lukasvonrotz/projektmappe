class Iochannel < ApplicationRecord
  belongs_to :iogroupcomponent
  validates :iogroupcomponent, :presence => true

  has_one :iosignal, dependent: :nullify

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
    delimiter = '.'
    address = ''
    address += add_address_part(self.iogroupcomponent.iogroup.address_prefix.to_s, delimiter)
    address += add_address_part(self.iogroupcomponent.iogroup.profibus_address.to_s, delimiter)
    address += add_address_part(self.kanalnummer.to_s, delimiter)
    address += add_address_part(self.address_suffix.to_s, delimiter)
    address +=  ' ('+ self.channeltype + ')'
  end

  private
  def add_address_part(tagname, delimiter)
    if tagname.to_s == ''
      ''
    else
      tagname += delimiter
    end

  end
end
