class CreateDrives < ActiveRecord::Migration[5.0]
  def change
    create_table :drives do |t|
      t.string :kennung
      t.string :artikelnr
      t.text :bezeichnung
      t.float :un
      t.float :in
      t.float :pn
      t.string :bg
      t.float :brutto
      t.float :rabatt

      t.timestamps
    end
  end
end
