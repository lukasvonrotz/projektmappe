class AssembliesIogroups < ActiveRecord::Migration[5.0]
  def change
    create_table :assemblies_iogroups, :id => false do |t|
      t.integer :assembly_id
      t.integer :iogroup_id
    end
    add_index :assemblies_iogroups, [ :assembly_id, :iogroup_id ], :unique => true
  end
end
