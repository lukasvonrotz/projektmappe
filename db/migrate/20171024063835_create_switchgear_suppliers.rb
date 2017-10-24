class CreateSwitchgearSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :switchgear_suppliers do |t|
      t.integer :switchgear_id, null: false
      t.integer :supplier_id, null: false

      t.float :brutto, :default => 0, null: false
      t.float :rabatt, :default => 0, null: false

      t.timestamps
    end
    add_index :switchgear_suppliers, [:switchgear_id, :supplier_id], :unique => true, :name => 'switchgear_supplier_unique'
  end
end
