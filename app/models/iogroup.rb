class Iogroup < ApplicationRecord

  require 'csv'


  belongs_to :switchgearcombination
  validates :switchgearcombination, :presence => true
  belongs_to :iotype
  validates :iotype, :presence => true

  #delete association in grobengineerings if iogroup is deleted
  has_many :grobengineerings, dependent: :nullify

  has_and_belongs_to_many :assemblies

  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end
end
