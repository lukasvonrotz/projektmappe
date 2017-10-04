class AddColumnsToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :kabelsteuerunglaenge, :float, :default => 0, null: false
    add_column :devices, :kabelspeisunglaenge, :float, :default => 0, null: false
    add_column :devices, :kabelpotausgleichlaenge, :float, :default => 0, null: false
    add_column :devices, :installationtrasselaenge, :float, :default => 0, null: false
    add_column :devices, :installationrohrlaenge, :float, :default => 0, null: false
    add_column :devices, :installationgeraetelaenge, :float, :default => 0, null: false
  end
end
