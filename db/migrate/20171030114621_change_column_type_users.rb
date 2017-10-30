class ChangeColumnTypeUsers < ActiveRecord::Migration[5.0]
  def change

    remove_column :users, :sortierung_assemblies, :string
    remove_column :users, :sortierung_customers, :string
    remove_column :users, :sortierung_devices, :string
    remove_column :users, :sortierung_drives, :string
    remove_column :users, :sortierung_elinst, :string
    remove_column :users, :sortierung_grobengineerings
    remove_column :users, :sortierung_iogroups, :string
    remove_column :users, :sortierung_iosignals, :string
    remove_column :users, :sortierung_subprojects, :string
    remove_column :users, :sortierung_switchgears, :string
    remove_column :users, :sortierung_switchgearcombinations
    remove_column :users, :sortierung_wires, :string

    add_column :users, :sortierung_assemblies, :integer, :default => 0, null: false
    add_column :users, :sortierung_customers, :integer, :default => 0, null: false
    add_column :users, :sortierung_devices, :integer, :default => 0, null: false
    add_column :users, :sortierung_drives, :integer, :default => 0, null: false
    add_column :users, :sortierung_elinst, :integer, :default => 0, null: false
    add_column :users, :sortierung_grobengineerings, :integer, :default => 0, null: false
    add_column :users, :sortierung_iogroups, :integer, :default => 0, null: false
    add_column :users, :sortierung_iosignals, :integer, :default => 0, null: false
    add_column :users, :sortierung_subprojects, :integer, :default => 0, null: false
    add_column :users, :sortierung_switchgears, :integer, :default => 0, null: false
    add_column :users, :sortierung_switchgearcombinations, :integer, :default => 0, null: false
    add_column :users, :sortierung_wires, :integer, :default => 0, null: false
  end
end
