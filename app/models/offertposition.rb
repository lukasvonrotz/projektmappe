class Offertposition < ApplicationRecord

  require 'csv'


  belongs_to :subsubproject
  validates :subsubproject, :presence => true

  #delete association in grobengineerings if offertposition is deleted
  has_many :grobengineerings, dependent: :nullify

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
