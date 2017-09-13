class CreateWireSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :wire_suppliers do |t|

      t.integer :wire_id
      t.integer :supplier_id
      t.float :anschlusstableauseite
      t.float :anschlussgeraeteseite
      t.float :beschriftungkabeleinanschluss
      t.float :beschriftungaderneinanschluss
      t.float :installationhohlboden
      t.float :installationtrasse
      t.float :installationrohr

      t.timestamps
    end
    add_index :wire_suppliers, [:wire_id, :supplier_id], :unique => true
  end
end
