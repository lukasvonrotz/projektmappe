class AddSortierungenToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sortierung_assemblies, :string, :default => "id"
    add_column :users, :anzahl_eintraege_assemblies, :integer, :default => 10, null: false
    add_column :users, :sortierung_customers, :string, :default => "id"
    add_column :users, :anzahl_eintraege_customers, :integer, :default => 10, null: false
    add_column :users, :sortierung_devices, :string, :default => "id"
    add_column :users, :anzahl_eintraege_devices, :integer, :default => 10, null: false
    add_column :users, :sortierung_drives, :string, :default => "id"
    add_column :users, :anzahl_eintraege_drives, :integer, :default => 10, null: false
    add_column :users, :sortierung_elinst, :string, :default => "id"
    add_column :users, :anzahl_eintraege_elinst, :integer, :default => 10, null: false
    add_column :users, :sortierung_grobengineerings, :string, :default => "id"
    add_column :users, :anzahl_eintraege_grobengineerings, :integer, :default => 10, null: false
    add_column :users, :sortierung_iogroups, :string, :default => "id"
    add_column :users, :anzahl_eintraege_iogroups, :integer, :default => 10, null: false
    add_column :users, :sortierung_iosignals, :string, :default => "id"
    add_column :users, :anzahl_eintraege_iosignals, :integer, :default => 10, null: false
    add_column :users, :sortierung_subprojects, :string, :default => "id"
    add_column :users, :anzahl_eintraege_subprojects, :integer, :default => 10, null: false
    add_column :users, :sortierung_switchgears, :string, :default => "id"
    add_column :users, :anzahl_eintraege_switchgears, :integer, :default => 10, null: false
    add_column :users, :sortierung_switchgearcombinations, :string, :default => "id"
    add_column :users, :anzahl_eintraege_switchgearcombinations, :integer, :default => 10, null: false
    add_column :users, :sortierung_wires, :string, :default => "id"
    add_column :users, :anzahl_eintraege_wires, :integer, :default => 10, null: false
  end
end
