class IogroupsAssemblies < ActiveRecord::Migration[5.0]
  def change
    create_table :iogroups_assemblies, :id => false do |t|
      t.integer :iogroup_id
      t.integer :assembly_id
    end
    add_index :iogroups_assemblies, [ :iogroup_id, :assembly_id ], :unique => true
  end
end
