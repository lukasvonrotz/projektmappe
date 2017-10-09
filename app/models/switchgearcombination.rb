class Switchgearcombination < ApplicationRecord

  require 'csv'

  belongs_to :switchgear
  validates :switchgear, :presence => true
  has_many :iogroups

  validates :u_feed_power, presence:true, numericality: {only_float: true}
  validates :u_feed_control, presence:true, numericality: {only_float: true}
  validates :u_out_power, presence:true, numericality: {only_float: true}
  validates :u_out_control_high, presence:true, numericality: {only_float: true}
  validates :u_out_control_low, presence:true, numericality: {only_float: true}

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
