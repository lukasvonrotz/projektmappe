class Wirecaptionprice < ApplicationRecord
  belongs_to :supplier
  validates :supplier, :presence => true

  validates :kostenkabelmitmontagetraeger, presence:true, numericality: {only_float: true}
  validates :kostenadermitmontagehuelse, presence:true, numericality: {only_float: true}
end
