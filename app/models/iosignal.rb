class Iosignal < ApplicationRecord
  require 'csv'

  belongs_to :iochannel, :optional => true

  belongs_to :grobengineering
  validates :grobengineering, :presence => true

  #delete all associated iosignalenginfos if iosignal is deleted
  has_many :iosignalenginfos, dependent: :destroy

  #delete all associated iosignalibninfos if iosignal is deleted
  has_many :iosignalibninfos, dependent: :destroy

  validates :signal_ana_range_min, numericality: {only_float: true, :presence => true}
  validates :signal_ana_range_max, numericality: {only_float: true, :presence => true}
  validates :signal_ana_range_decimals, numericality: {only_integer: true, :presence => true}
  validates :bus, numericality: {only_integer: true, :presence => true}
  validates :di, numericality: {only_integer: true, :presence => true}
  validates :do, numericality: {only_integer: true, :presence => true}
  validates :ai, numericality: {only_integer: true, :presence => true}
  validates :ao, numericality: {only_integer: true, :presence => true}
  validates :z, numericality: {only_integer: true, :presence => true}
  validates :inkr, numericality: {only_integer: true, :presence => true}
  validates :ssi, numericality: {only_integer: true, :presence => true}
  validates :safety, numericality: {only_integer: true, :presence => true}
  validates :ex, numericality: {only_integer: true, :presence => true}

  def tagname
    delimiter = self.grobengineering.subsubproject.subproject.trennzeichen.to_s
    tagname = ''
    tagname += add_tag_part(self.grobengineering.tag_anlage.to_s, delimiter)
    tagname += add_tag_part(self.grobengineering.tag_objekt.to_s, delimiter)
    tagname += add_tag_part(self.grobengineering.tag_nummer.to_s, delimiter)
    tagname += add_tag_part(self.tagname_suffix.to_s, '')
  end

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

  private
  def add_tag_part(tagname, delimiter)
    if tagname.to_s == ''
      ''
    else
      tagname += delimiter
    end

  end
end