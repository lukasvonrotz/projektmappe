class Switchgearconnection < ApplicationRecord
  belongs_to :topswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'topswitchgear_id'
  belongs_to :bottomswitchgear, :class_name => 'Switchgearcombination', :foreign_key => 'bottomswitchgear_id'
end
