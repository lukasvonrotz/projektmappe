class Drive < ApplicationRecord

  require 'csv'

  validates :brutto, presence:true, numericality: {only_float: true}
  validates :rabatt, presence:true, numericality: {only_float: true}

  def netto
    return self.brutto - (self.brutto * self.rabatt)
  end

  def self.to_csv
    exclude_columns = ['id']
    attributes = column_names - exclude_columns

    CSV.generate(headers: true, col_sep: ";", encoding: "utf-8") do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, :col_sep => (";"), :encoding => 'utf-8', headers: :first_row, header_converters: :symbol) do |row|
      begin
        new_record = row.to_hash
        if Drive.where(:kennung => new_record[:kennung]).any?
          # if this device already exists, only update existing entry
          existing_record = Drive.where(:kennung => new_record[:kennung]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          Drive.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end

end
