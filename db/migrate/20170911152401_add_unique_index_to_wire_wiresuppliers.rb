class AddUniqueIndexToWireWiresuppliers < ActiveRecord::Migration[5.0]
  def change
    add_index :wire_wiresuppliers, [:wire_id, :wiresupplier_id], :unique => true
  end
end
