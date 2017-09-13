class CreateSupplierSuppliertypes < ActiveRecord::Migration[5.0]
  def change
    create_table :supplier_suppliertypes do |t|

      t.integer :supplier_id
      t.integer :suppliertype_id

      t.timestamps
    end
    add_index :supplier_suppliertypes, [:supplier_id, :suppliertype_id], :unique => true
  end
end
