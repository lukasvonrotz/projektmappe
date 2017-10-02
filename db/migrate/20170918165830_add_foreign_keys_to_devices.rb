class AddForeignKeysToDevices < ActiveRecord::Migration[5.0]
  def change
    add_reference :devices, :switchgear_einbau, index: true
    add_reference :devices, :wire_steuerung, index: true
    add_reference :devices, :wire_speisung, index: true
    add_reference :devices, :wire_potausgleich, index: true
    add_reference :devices, :elinst_trasse, index: true
    add_reference :devices, :elinst_rohr, index: true
    add_reference :devices, :elinst_geraete, index: true

    add_foreign_key :devices, :switchgears, column: :switchgear_einbau_id
    add_foreign_key :devices, :wires, column: :wire_steuerung_id
    add_foreign_key :devices, :wires, column: :wire_speisung_id
    add_foreign_key :devices, :wires, column: :wire_potausgleich_id
    add_foreign_key :devices, :electrical_installations, column: :elinst_trasse_id
    add_foreign_key :devices, :electrical_installations, column: :elinst_rohr_id
    add_foreign_key :devices, :electrical_installations, column: :elinst_geraete_id

  end
end
