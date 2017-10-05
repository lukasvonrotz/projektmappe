class CreateSubsubprojects < ActiveRecord::Migration[5.0]
  def change
    create_table :subsubprojects do |t|
      t.string :name
      t.boolean :master, :default => false, null: false
      t.float :eurokurs, :default => 0, null: false
      t.boolean :proiorechnen, :default => false, null: false
      t.float :hourrate_admin, :default => 0, null: false
      t.float :hourrate_steuerkonzept, :default => 0, null: false
      t.float :hourrate_ioliste, :default => 0, null: false
      t.float :hourrate_elplanung, :default => 0, null: false
      t.float :hourrate_fktbeschrieb, :default => 0, null: false
      t.float :hourrate_safetymatrix, :default => 0, null: false
      t.float :hourrate_software, :default => 0, null: false
      t.float :hourrate_softwaresafety, :default => 0, null: false
      t.float :hourrate_bauleitung, :default => 0, null: false
      t.float :hourrate_parametrierung, :default => 0, null: false
      t.float :hourrate_signaltest, :default => 0, null: false
      t.float :hourrate_safetytest, :default => 0, null: false
      t.float :hourrate_fkttestkalt, :default => 0, null: false
      t.float :hourrate_fkttestheiss, :default => 0, null: false
      t.float :hourrate_konformitaet, :default => 0, null: false

      t.float :complexity_admin, :default => 1, null: false
      t.float :complexity_steuerkonzept, :default => 1, null: false
      t.float :complexity_ioliste, :default => 1, null: false
      t.float :complexity_elplanung, :default => 1, null: false
      t.float :complexity_fktbeschrieb, :default => 1, null: false
      t.float :complexity_safetymatrix, :default => 1, null: false
      t.float :complexity_software, :default => 1, null: false
      t.float :complexity_softwaresafety, :default => 1, null: false
      t.float :complexity_bauleitung, :default => 1, null: false
      t.float :complexity_parametrierung, :default => 1, null: false
      t.float :complexity_signaltest, :default => 1, null: false
      t.float :complexity_safetytest, :default => 1, null: false
      t.float :complexity_fkttestkalt, :default => 1, null: false
      t.float :complexity_fkttestheiss, :default => 1, null: false
      t.float :complexity_konformitaet, :default => 1, null: false

      t.timestamps
    end
    add_reference :subsubprojects, :subproject, index: true, foreign_key: true, null: false

    add_reference :subsubprojects, :wiresupplier, index: true, null: false
    add_reference :subsubprojects, :wirecaptionsupplier, index: true, null: false

    add_foreign_key :subsubprojects, :suppliers, column: :wiresupplier_id
    add_foreign_key :subsubprojects, :suppliers, column: :wirecaptionsupplier_id
  end
end
