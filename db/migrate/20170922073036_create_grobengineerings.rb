class CreateGrobengineerings < ActiveRecord::Migration[5.0]
  def change
    create_table :grobengineerings do |t|
      t.string :offertposition
      t.text :beschreibung
      t.text :kommentar
      t.text :device_import
      t.integer :device_anzahl, :default => 1, null: false
      t.boolean :update_necessary
      t.string :tagnr
      t.string :tagname
      t.text :bezeichnung
      t.text :bemerkung
      t.float :funktion_sw, :default => 0, null: false
      t.float :kabel_spez1_laenge, :default => 0, null: false
      t.float :kabel_spez2_laenge, :default => 0, null: false
      t.float :kabel_spez3_laenge, :default => 0, null: false
      t.string :sicherheitszone
      t.string :lieferant
      t.float :spannung, :default => 0, null: false
      t.float :leistung, :default => 0, null: false
      t.float :strom, :default => 0, null: false

      t.timestamps
    end

    add_reference :grobengineerings, :subsubproject, index: true, foreign_key: true, null: false
    add_reference :grobengineerings, :device, index: true, foreign_key: true, null: false
    add_reference :grobengineerings, :subsystem, index: true, foreign_key: true
    add_reference :grobengineerings, :iogroup, index: true, foreign_key: true

    add_reference :grobengineerings, :switchgear_motorenabgang, index: true
    add_reference :grobengineerings, :fu_typ, index: true
    add_reference :grobengineerings, :wire_spez1, index: true
    add_reference :grobengineerings, :wire_spez2, index: true
    add_reference :grobengineerings, :wire_spez3, index: true

    add_foreign_key :grobengineerings, :switchgears, column: :switchgear_motorenabgang_id
    add_foreign_key :grobengineerings, :drives, column: :fu_typ_id
    add_foreign_key :grobengineerings, :wires, column: :wire_spez1_id
    add_foreign_key :grobengineerings, :wires, column: :wire_spez2_id
    add_foreign_key :grobengineerings, :wires, column: :wire_spez3_id


  end
end
