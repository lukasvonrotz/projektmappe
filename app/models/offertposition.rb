class Offertposition < ApplicationRecord

  require 'csv'

  has_many :offer_offertpositions, dependent: :destroy
  has_many :offers, :through => :offer_offertpositions

  belongs_to :subsubproject
  validates :subsubproject, :presence => true

  #delete association in grobengineerings if offertposition is deleted
  has_many :grobengineerings, dependent: :nullify

  validates :name, uniqueness:  { scope: :subsubproject_id,
                                    message: " für Offertposition bereits vergeben." }

  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.order(:id).each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end
end
