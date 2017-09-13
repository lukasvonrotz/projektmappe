class CreateWirecaptionprices < ActiveRecord::Migration[5.0]
  def change
    create_table :wirecaptionprices do |t|
      t.float :kostenkabelmitmontagetraeger
      t.float :kostenadermitmontagehuelse

      t.timestamps
    end
    add_reference :wirecaptionprices, :supplier, index: true, foreign_key: true
  end
end
