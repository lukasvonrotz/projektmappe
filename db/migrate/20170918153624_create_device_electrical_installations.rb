class CreateDeviceElectricalInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :device_electrical_installations do |t|
      t.integer :device_id
      t.integer :electrical_installation_id
      t.string :definition
      t.float :laenge


      t.timestamps
    end
  end
end
