class CreateGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    create_table :grobengineerings do |t|
      t.string :offertposition
      t.text :beschreibung
      t.text :kommentar
      t.text :device_import
      t.integer :device_anzahl
      t.boolean :update_necessary
      t.string :tagnr
      t.string :tagname
      t.text :bezeichnung
      t.text :bemerkung
      t.float :funktion_sw
      t.float :kabel_spez1_laenge
      t.float :kabel_spez2_laenge
      t.float :kabel_spez3_laenge
      t.string :sicherheitszone
      t.string :lieferant
      t.float :spannung
      t.float :leistung
      t.float :strom

      t.timestamps
    end
  end
end
