class AddForeignKeysToGrobengineerings < ActiveRecord::Migration[5.0]
  def change
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
