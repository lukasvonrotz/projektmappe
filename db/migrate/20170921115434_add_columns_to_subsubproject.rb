class AddColumnsToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_column :subsubprojects, :hourrate_admin, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_steuerkonzept, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_ioliste, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_elplanung, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_fktbeschrieb, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_safetymatrix, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_software, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_softwaresafety, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_bauleitung, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_parametrierung, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_signaltest, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_safetytest, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_fkttestkalt, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_fkttestheiss, :float, :default => 0, null: false
    add_column :subsubprojects, :hourrate_konformitaet, :float, :default => 0, null: false

    add_column :subsubprojects, :complexity_admin, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_steuerkonzept, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_ioliste, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_elplanung, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_fktbeschrieb, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_safetymatrix, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_software, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_softwaresafety, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_bauleitung, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_parametrierung, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_signaltest, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_safetytest, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_fkttestkalt, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_fkttestheiss, :float, :default => 1, null: false
    add_column :subsubprojects, :complexity_konformitaet, :float, :default => 1, null: false
  end
end
