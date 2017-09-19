class AddSwitchgearToDevices < ActiveRecord::Migration[5.0]
  def change
    add_reference :devices, :switchgear, index: true, foreign_key: true
  end
end
