class Switchgearconnection < ApplicationRecord
  belongs_to :topswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'topswitchgear_id'
  validates :topswitchgear, :presence => true
  belongs_to :bottomswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'bottomswitchgear_id'
  validates :bottomswitchgear, :presence => true

  validates :level, :presence => true, numericality: {only_integer: true}
  validates :topswitchgear_id, uniqueness:  { scope: :bottomswitchgear_id,
                                              message: ": Diese Verbindung existiert bereits!" }

  # CSV Export
  def self.to_csv
    attributes = column_names

    CSV.generate(headers: true, col_sep: ";", encoding: "iso-8859-1") do |csv|
      csv << attributes

      all.order(:id).each do |entry|
        csv << attributes.map{ |attr| entry.send(attr) }
      end
    end
  end

  # CSV Import
  def self.import(file)
    records_to_save = []
    records_to_update = []
    begin
      CSV.foreach(file.path, :col_sep => (";"), :encoding => 'iso-8859-1', headers: :first_row, header_converters: :symbol) do |row|
        new_record = row.to_hash.except(:id)
        if Switchgearconnection.where(:topswitchgear_id => new_record[:topswitchgear_id],
                                      :bottomswitchgear_id => new_record[:bottomswitchgear_id]).any?
          # if this device already exists, only update existing entry
          existing_record = Switchgearconnection.where(:topswitchgear_id => new_record[:topswitchgear_id],
                                                       :bottomswitchgear_id => new_record[:bottomswitchgear_id]).first
          existing_record.assign_attributes(new_record)
          if existing_record.valid?
            records_to_update << existing_record
          else
            return 'Import konnte nicht durchgeführt werden!'
          end
        else
          if Switchgearconnection.new(new_record).valid?
            records_to_save << new_record
          else
            return 'Import konnte nicht durchgeführt werden!'
          end
        end
      end
      records_to_save.each do |record|
        Switchgearconnection.create! record
      end
      records_to_update.each do |record|
        record.save!
      end
      return ''
    rescue Exception => ex
      if file.nil?
        return 'Dateipfad ungültig'
      else
        return ex
      end
    end
  end
end
