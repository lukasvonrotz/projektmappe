class AddUniqueConstraintToDeviceWires < ActiveRecord::Migration[5.0]
  def change
    add_index :device_wires, [:device_id, :definition], :unique => true
  end
end
