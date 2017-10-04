class Switchgearcombination < ApplicationRecord
  belongs_to :switchgear
  validates :switchgear, :presence => true
  has_many :iogroups

  validates :u_feed_power, presence:true, numericality: {only_float: true}
  validates :u_feed_control, presence:true, numericality: {only_float: true}
  validates :u_out_power, presence:true, numericality: {only_float: true}
  validates :u_out_control_high, presence:true, numericality: {only_float: true}
  validates :u_out_control_low, presence:true, numericality: {only_float: true}
end
