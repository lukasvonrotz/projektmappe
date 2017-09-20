class AddUniqueConstraintToDeviceElectricalInstallations < ActiveRecord::Migration[5.0]
  def change
    add_index :device_electrical_installations,
              [:device_id, :definition],
              :unique => true,
              :name => "device_electrical_installations_uniqueness"

  end
end
