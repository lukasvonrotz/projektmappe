class CreateDriveSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :drive_suppliers do |t|
      t.integer :drive_id, null: false
      t.integer :supplier_id, null: false

      t.float :brutto, :default => 0, null: false
      t.float :rabatt, :default => 0, null: false

      t.timestamps
    end
    add_index :drive_suppliers, [:drive_id, :supplier_id], :unique => true, :name => 'drive_supplier_unique'
  end
end
