class CreateDeviceWires < ActiveRecord::Migration[5.0]
  def change
    create_table :device_wires do |t|
      t.integer :device_id
      t.integer :wire_id
      t.string :definition
      t.float :laenge

      t.timestamps
    end
  end
end
