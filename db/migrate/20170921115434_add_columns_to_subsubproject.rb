class AddColumnsToSubsubproject < ActiveRecord::Migration[5.0]
  def change
    add_column :subsubprojects, :hourrate_admin, :float
    add_column :subsubprojects, :hourrate_steuerkonzept, :float
    add_column :subsubprojects, :hourrate_ioliste, :float
    add_column :subsubprojects, :hourrate_elplanung, :float
    add_column :subsubprojects, :hourrate_fktbeschrieb, :float
    add_column :subsubprojects, :hourrate_safetymatrix, :float
    add_column :subsubprojects, :hourrate_software, :float
    add_column :subsubprojects, :hourrate_softwaresafety, :float
    add_column :subsubprojects, :hourrate_bauleitung, :float
    add_column :subsubprojects, :hourrate_parametrierung, :float
    add_column :subsubprojects, :hourrate_signaltest, :float
    add_column :subsubprojects, :hourrate_safetytest, :float
    add_column :subsubprojects, :hourrate_fkttestkalt, :float
    add_column :subsubprojects, :hourrate_fkttestheiss, :float
    add_column :subsubprojects, :hourrate_konformitaet, :float

    add_column :subsubprojects, :complexity_admin, :float
    add_column :subsubprojects, :complexity_steuerkonzept, :float
    add_column :subsubprojects, :complexity_ioliste, :float
    add_column :subsubprojects, :complexity_elplanung, :float
    add_column :subsubprojects, :complexity_fktbeschrieb, :float
    add_column :subsubprojects, :complexity_safetymatrix, :float
    add_column :subsubprojects, :complexity_software, :float
    add_column :subsubprojects, :complexity_softwaresafety, :float
    add_column :subsubprojects, :complexity_bauleitung, :float
    add_column :subsubprojects, :complexity_parametrierung, :float
    add_column :subsubprojects, :complexity_signaltest, :float
    add_column :subsubprojects, :complexity_safetytest, :float
    add_column :subsubprojects, :complexity_fkttestkalt, :float
    add_column :subsubprojects, :complexity_fkttestheiss, :float
    add_column :subsubprojects, :complexity_konformitaet, :float
  end
end
