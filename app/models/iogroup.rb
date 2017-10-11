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

  def self.import(file)
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      begin
        new_record = row.to_hash.except(:id)
        if Iogroup.where(:name => new_record[:name]).any?
          # if this device already exists, only update existing entry
          existing_record = Iogroup.where(:name => new_record[:name]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          Iogroup.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end
end
