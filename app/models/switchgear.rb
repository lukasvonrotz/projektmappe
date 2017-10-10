class Switchgear < ApplicationRecord

  require 'csv'


  validates :maxstrom, numericality: {only_float: true, allow_blank: true}
  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}
  validates :typ, presence:true

  has_many :switchgearcombinations, dependent: :destroy

  def netto
    self.brutto - (self.brutto * self.rabatt)
  end

  def self.to_csv
    exclude_columns = ['id']
    attributes = column_names - exclude_columns

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
        new_record = row.to_hash
        if Switchgear.where(:kennung => new_record[:kennung]).any?
          # if this device already exists, only update existing entry
          existing_record = Switchgear.where(:kennung => new_record[:kennung]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          Switchgear.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end

end
