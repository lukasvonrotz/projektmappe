class CreateElectricalInstallationSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :electrical_installation_suppliers do |t|
      t.integer :electrical_installation_id, null: false
      t.integer :supplier_id, null: false

      t.float :brutto, :default => 0, null: false
      t.float :rabatt, :default => 0, null: false

      t.timestamps
    end
    add_index :electrical_installation_suppliers, [:electrical_installation_id, :supplier_id], :unique => true, :name => 'electrical_installation_supplier_unique'
  end
end
