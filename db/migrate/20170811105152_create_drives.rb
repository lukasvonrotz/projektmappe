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
      t.float :brutto
      t.float :rabatt, :default => 0

      t.timestamps
    end
  end
end
