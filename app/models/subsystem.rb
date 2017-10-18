class Subsystem < ApplicationRecord

  require 'csv'


  belongs_to :project
  validates :project, :presence => true
  has_many :units, dependent: :destroy

  #delete association in grobengineerings if subsystem is deleted
  has_many :grobengineerings, dependent: :nullify

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
end
