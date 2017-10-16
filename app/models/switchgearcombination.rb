class Switchgearcombination < ApplicationRecord

  require 'csv'

  belongs_to :switchgear
  validates :switchgear, :presence => true
  has_many :iogroups, dependent: :nullify

  #delete association in grobengineerings if switchgearcombination is deleted
  has_many :preisberechnng_grobengineerings, class_name: "Grobengineering",
           foreign_key: "schaltschrank_preisberechnung_id",
           dependent: :nullify

  has_many :top_switchgearconnections, class_name: "Switchgearconnection",
           foreign_key: "topswitchgear_id",
           dependent: :destroy
  has_many :bottom_switchgearconnections, class_name: "Switchgearconnection",
           foreign_key: "bottomswitchgear_id",
           dependent: :destroy


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

  def self.import(file)
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      begin
        new_record = row.to_hash.except(:id)
        if Switchgearcombination.where(:name => new_record[:name]).any?
          # if this device already exists, only update existing entry
          existing_record = Switchgearcombination.where(:name => new_record[:name]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          Switchgearcombination.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end
end
