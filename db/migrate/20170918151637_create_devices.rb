class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.text :definition
      t.float :eng_admin, :default => 0, null: false
      t.float :eng_steuerkonzept, :default => 0, null: false
      t.float :eng_ioliste, :default => 0, null: false
      t.float :eng_elplanung, :default => 0, null: false
      t.float :eng_fktbeschrieb, :default => 0, null: false
      t.float :eng_safetymatrix, :default => 0, null: false
      t.float :eng_software, :default => 0, null: false
      t.float :eng_softwaresafety, :default => 0, null: false
      t.float :eng_bauleitung, :default => 0, null: false
      t.float :eng_parametrierung, :default => 0, null: false
      t.float :eng_signaltest, :default => 0, null: false
      t.float :eng_safetytest, :default => 0, null: false
      t.float :eng_fkttestkalt, :default => 0, null: false
      t.float :eng_fkttestheiss, :default => 0, null: false
      t.float :eng_konformitaet, :default => 0, null: false
      t.integer :ger_beschriftung, :default => 0, null: false
      t.integer :ger_sensor, :default => 0, null: false
      t.integer :ger_ventil, :default => 0, null: false
      t.integer :ger_heizung, :default => 0, null: false
      t.integer :ger_m1r, :default => 0, null: false
      t.integer :ger_m2r, :default => 0, null: false
      t.integer :ger_mfu, :default => 0, null: false
      t.integer :ger_wicklung, :default => 0, null: false
      t.integer :ger_bremse, :default => 0, null: false
      t.integer :ger_geraeteheizung, :default => 0, null: false
      t.integer :ger_kommunikation, :default => 0, null: false
      t.integer :ger_safety, :default => 0, null: false
      t.integer :ger_spsmodul, :default => 0, null: false
      t.integer :sig_di, :default => 0, null: false
      t.integer :sig_do, :default => 0, null: false
      t.integer :sig_ai, :default => 0, null: false
      t.integer :sig_ao, :default => 0, null: false
      t.integer :sig_z, :default => 0, null: false
      t.integer :sig_inkr, :default => 0, null: false
      t.integer :sig_ssi, :default => 0, null: false
      t.integer :sig_pb, :default => 0, null: false
      t.integer :sig_sdi, :default => 0, null: false
      t.integer :sig_sdo, :default => 0, null: false
      t.integer :sig_sai, :default => 0, null: false
      t.integer :sig_sao, :default => 0, null: false
      t.integer :sch_anzahl, :default => 0, null: false

      t.float :kabelsteuerunglaenge, :default => 0, null: false
      t.float :kabelspeisunglaenge, :default => 0, null: false
      t.float :kabelpotausgleichlaenge, :default => 0, null: false
      t.float :installationtrasselaenge, :default => 0, null: false
      t.float :installationrohrlaenge, :default => 0, null: false
      t.float :installationgeraetelaenge, :default => 0, null: false

      t.timestamps
    end

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
