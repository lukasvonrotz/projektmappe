class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices do |t|
      t.text :definition
      t.float :eng_admin
      t.float :eng_steuerkonzept
      t.float :eng_ioliste
      t.float :eng_elplanung
      t.float :eng_fktbeschrieb
      t.float :eng_safetymatrix
      t.float :eng_software
      t.float :eng_softwaresafety
      t.float :eng_bauleitung
      t.float :eng_parametrierung
      t.float :eng_signaltest
      t.float :eng_safetytest
      t.float :eng_fkttestkalt
      t.float :eng_fkttestheiss
      t.float :eng_konformitaet
      t.integer :ger_beschriftung
      t.integer :ger_sensor
      t.integer :ger_ventil
      t.integer :ger_heizung
      t.integer :ger_m1r
      t.integer :ger_m2r
      t.integer :ger_mfu
      t.integer :ger_wicklung
      t.integer :ger_bremse
      t.integer :ger_geraeteheizung
      t.integer :ger_kommunikation
      t.integer :ger_safety
      t.integer :sig_di
      t.integer :sig_do
      t.integer :sig_ai
      t.integer :sig_ao
      t.integer :sig_z
      t.integer :sig_inkr
      t.integer :sig_ssi
      t.integer :sig_pb
      t.integer :sig_sdi
      t.integer :sig_sdo
      t.integer :sig_sai
      t.integer :sig_sao
      t.integer :sch_anzahl

      t.timestamps
    end
  end
end
