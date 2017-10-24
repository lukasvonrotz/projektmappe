class CreateWirecaptionprices < ActiveRecord::Migration[5.0]
  def change
    create_table :wirecaptionprices do |t|
      t.float :kostenkabelmitmontagetraeger, :default => 0, null: false
      t.float :kostenadermitmontagehuelse, :default => 0, null: false

      t.timestamps
    end
    add_reference :wirecaptionprices, :supplier, index: true, foreign_key: true, null: false
    add_index :wirecaptionprices, :supplier_id, :unique => true, :name => 'wirecaptionprices_supplier_unique'
  end
end
