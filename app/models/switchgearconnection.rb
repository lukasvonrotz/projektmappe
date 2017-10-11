class Switchgearconnection < ApplicationRecord
  belongs_to :topswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'topswitchgear_id'
  validates :topswitchgear, :presence => true
  belongs_to :bottomswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'bottomswitchgear_id'
  validates :bottomswitchgear, :presence => true

  validates :level, :presence => true, numericality: {only_integer: true}

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
        if Switchgearconnection.where(:topswitchgear_id => new_record[:topswitchgear_id],
                                      :bottomswitchgear_id => new_record[:bottomswitchgear_id]).any?
          # if this device already exists, only update existing entry
          existing_record = Switchgearconnection.where(:topswitchgear_id => new_record[:topswitchgear_id],
                                                       :bottomswitchgear_id => new_record[:bottomswitchgear_id]).first
          existing_record.update_attributes(new_record)
          existing_record.save!
        else
          Switchgearconnection.create! new_record
        end
      rescue Exception => ex
        return ex
      end
    end
  end
end
