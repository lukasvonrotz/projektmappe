class Switchgearconnection < ApplicationRecord
  belongs_to :topswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'topswitchgear_id'
  validates :topswitchgear, :presence => true
  belongs_to :bottomswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'bottomswitchgear_id'
  validates :bottomswitchgear, :presence => true

  validates :level, :presence => true, numericality: {only_integer: true}
end
