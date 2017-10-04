class AddDefaultValueToDeviceAnzahl < ActiveRecord::Migration[5.0]
  def change
    change_column :grobengineerings, :device_anzahl, :integer, :default => 1, null: false
  end
end
