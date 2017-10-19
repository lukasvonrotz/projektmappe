class AddStartnrToAssembly < ActiveRecord::Migration[5.0]
  def change
    add_column :assemblies, :kanal_startnummer, :integer, :default => 1, null: false
  end
end
