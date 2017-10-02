class AddColumnsToDevices < ActiveRecord::Migration[5.0]
  def change
    add_column :devices, :kabelsteuerunglaenge, :float
    add_column :devices, :kabelspeisunglaenge, :float
    add_column :devices, :kabelpotausgleichlaenge, :float
    add_column :devices, :installationtrasselaenge, :float
    add_column :devices, :installationrohrlaenge, :float
    add_column :devices, :installationgeraetelaenge, :float
  end
end
