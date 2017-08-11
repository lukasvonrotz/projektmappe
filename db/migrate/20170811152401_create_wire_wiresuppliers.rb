class CreateWireWiresuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :wire_wiresuppliers do |t|
      t.integer :wire_id
      t.integer :wiresupplier_id
      t.float :anschlusstableauseite
      t.float :anschlussgeraeteseite
      t.float :beschriftungkabeleinanschluss
      t.float :beschriftungaderneinanschluss
      t.float :installationhohlboden
      t.float :installationtrasse
      t.float :installationrohr

      t.timestamps
    end
  end
end
