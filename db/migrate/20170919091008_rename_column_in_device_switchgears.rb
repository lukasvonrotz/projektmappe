class RenameColumnInDeviceSwitchgears < ActiveRecord::Migration[5.0]
  def change
    rename_column :device_electrical_installations, :laenge, :value
  end
end
