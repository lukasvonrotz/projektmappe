class CreateWireSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :wire_suppliers do |t|

      t.integer :wire_id, null: false
      t.integer :supplier_id, null: false
      t.float :anschlusstableauseite, :default => 0, null: false
      t.float :anschlussgeraeteseite, :default => 0, null: false
      t.float :beschriftungkabeleinanschluss, :default => 0, null: false
      t.float :beschriftungaderneinanschluss, :default => 0, null: false
      t.float :installationhohlboden, :default => 0, null: false
      t.float :installationtrasse, :default => 0, null: false
      t.float :installationrohr, :default => 0, null: false

      t.timestamps
    end
    add_index :wire_suppliers, [:wire_id, :supplier_id], :unique => true
  end
end
