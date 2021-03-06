class CreateDrives < ActiveRecord::Migration[5.0]
  def change
    create_table :drives do |t|
      t.string :kennung
      t.string :artikelnr
      t.text :bezeichnung
      t.text :un
      t.text :in
      t.text :pn
      t.string :bg

      t.timestamps
    end
    add_index :drives, :kennung, :unique => true, :name => 'drives_kennung_unique'
  end
end
