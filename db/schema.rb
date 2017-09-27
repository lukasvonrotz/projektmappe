# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170926115827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string   "kennung"
    t.integer  "kanaele"
    t.string   "artikelnr"
    t.text     "bezeichnung"
    t.float    "brutto_eur"
    t.float    "brutto_chf"
    t.float    "rabatt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "assemblies_iogroups", id: false, force: :cascade do |t|
    t.integer "assembly_id"
    t.integer "iogroup_id"
    t.index ["assembly_id", "iogroup_id"], name: "index_assemblies_iogroups_on_assembly_id_and_iogroup_id", unique: true, using: :btree
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "device_electrical_installations", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "electrical_installation_id"
    t.string   "definition"
    t.float    "value"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["device_id", "definition"], name: "device_electrical_installations_uniqueness", unique: true, using: :btree
  end

  create_table "device_wires", force: :cascade do |t|
    t.integer  "device_id"
    t.integer  "wire_id"
    t.string   "definition"
    t.float    "laenge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["device_id", "definition"], name: "index_device_wires_on_device_id_and_definition", unique: true, using: :btree
  end

  create_table "devices", force: :cascade do |t|
    t.text     "definition"
    t.float    "eng_admin"
    t.float    "eng_steuerkonzept"
    t.float    "eng_ioliste"
    t.float    "eng_elplanung"
    t.float    "eng_fktbeschrieb"
    t.float    "eng_safetymatrix"
    t.float    "eng_software"
    t.float    "eng_softwaresafety"
    t.float    "eng_bauleitung"
    t.float    "eng_parametrierung"
    t.float    "eng_signaltest"
    t.float    "eng_safetytest"
    t.float    "eng_fkttestkalt"
    t.float    "eng_fkttestheiss"
    t.float    "eng_konformitaet"
    t.integer  "ger_beschriftung"
    t.integer  "ger_sensor"
    t.integer  "ger_ventil"
    t.integer  "ger_heizung"
    t.integer  "ger_m1r"
    t.integer  "ger_m2r"
    t.integer  "ger_mfu"
    t.integer  "ger_wicklung"
    t.integer  "ger_bremse"
    t.integer  "ger_geraeteheizung"
    t.integer  "ger_kommunikation"
    t.integer  "ger_safety"
    t.integer  "sig_di"
    t.integer  "sig_do"
    t.integer  "sig_ai"
    t.integer  "sig_ao"
    t.integer  "sig_z"
    t.integer  "sig_inkr"
    t.integer  "sig_ssi"
    t.integer  "sig_pb"
    t.integer  "sig_sdi"
    t.integer  "sig_sdo"
    t.integer  "sig_sai"
    t.integer  "sig_sao"
    t.integer  "sch_anzahl"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "switchgear_id"
    t.index ["switchgear_id"], name: "index_devices_on_switchgear_id", using: :btree
  end

  create_table "drives", force: :cascade do |t|
    t.string   "kennung"
    t.string   "artikelnr"
    t.text     "bezeichnung"
    t.text     "un"
    t.text     "in"
    t.text     "pn"
    t.string   "bg"
    t.float    "brutto"
    t.float    "rabatt"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "electrical_installations", force: :cascade do |t|
    t.text     "kennung"
    t.text     "leistung"
    t.string   "einheit"
    t.float    "brutto"
    t.float    "rabatt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grobengineerings", force: :cascade do |t|
    t.string   "offertposition"
    t.text     "beschreibung"
    t.text     "kommentar"
    t.text     "device_import"
    t.integer  "device_anzahl"
    t.boolean  "update_necessary"
    t.string   "tagnr"
    t.string   "tagname"
    t.text     "bezeichnung"
    t.text     "bemerkung"
    t.float    "funktion_sw"
    t.float    "kabel_spez1_laenge"
    t.float    "kabel_spez2_laenge"
    t.float    "kabel_spez3_laenge"
    t.string   "sicherheitszone"
    t.string   "lieferant"
    t.float    "spannung"
    t.float    "leistung"
    t.float    "strom"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "subsubproject_id"
    t.integer  "device_id"
    t.integer  "subsystem_id"
    t.integer  "iogroup_id"
    t.integer  "switchgear_motorenabgang_id"
    t.integer  "fu_typ_id"
    t.integer  "wire_spez1_id"
    t.integer  "wire_spez2_id"
    t.integer  "wire_spez3_id"
    t.index ["device_id"], name: "index_grobengineerings_on_device_id", using: :btree
    t.index ["fu_typ_id"], name: "index_grobengineerings_on_fu_typ_id", using: :btree
    t.index ["iogroup_id"], name: "index_grobengineerings_on_iogroup_id", using: :btree
    t.index ["subsubproject_id"], name: "index_grobengineerings_on_subsubproject_id", using: :btree
    t.index ["subsystem_id"], name: "index_grobengineerings_on_subsystem_id", using: :btree
    t.index ["switchgear_motorenabgang_id"], name: "index_grobengineerings_on_switchgear_motorenabgang_id", using: :btree
    t.index ["wire_spez1_id"], name: "index_grobengineerings_on_wire_spez1_id", using: :btree
    t.index ["wire_spez2_id"], name: "index_grobengineerings_on_wire_spez2_id", using: :btree
    t.index ["wire_spez3_id"], name: "index_grobengineerings_on_wire_spez3_id", using: :btree
  end

  create_table "iogroups", force: :cascade do |t|
    t.string   "name"
    t.string   "profibus_address"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "iotype_id"
    t.integer  "switchgearcombination_id"
    t.index ["iotype_id"], name: "index_iogroups_on_iotype_id", using: :btree
    t.index ["switchgearcombination_id"], name: "index_iogroups_on_switchgearcombination_id", using: :btree
  end

  create_table "iotypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "by_project_and_user", unique: true, using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subproject_users", force: :cascade do |t|
    t.integer  "subproject_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["subproject_id", "user_id"], name: "by_subproject_and_user", unique: true, using: :btree
  end

  create_table "subprojects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "project_id"
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_subprojects_on_customer_id", using: :btree
    t.index ["project_id"], name: "index_subprojects_on_project_id", using: :btree
  end

  create_table "subsubprojects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "master"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "subproject_id"
    t.float    "hourrate_admin"
    t.float    "hourrate_steuerkonzept"
    t.float    "hourrate_ioliste"
    t.float    "hourrate_elplanung"
    t.float    "hourrate_fktbeschrieb"
    t.float    "hourrate_safetymatrix"
    t.float    "hourrate_software"
    t.float    "hourrate_softwaresafety"
    t.float    "hourrate_bauleitung"
    t.float    "hourrate_parametrierung"
    t.float    "hourrate_signaltest"
    t.float    "hourrate_safetytest"
    t.float    "hourrate_fkttestkalt"
    t.float    "hourrate_fkttestheiss"
    t.float    "hourrate_konformitaet"
    t.float    "complexity_admin"
    t.float    "complexity_steuerkonzept"
    t.float    "complexity_ioliste"
    t.float    "complexity_elplanung"
    t.float    "complexity_fktbeschrieb"
    t.float    "complexity_safetymatrix"
    t.float    "complexity_software"
    t.float    "complexity_softwaresafety"
    t.float    "complexity_bauleitung"
    t.float    "complexity_parametrierung"
    t.float    "complexity_signaltest"
    t.float    "complexity_safetytest"
    t.float    "complexity_fkttestkalt"
    t.float    "complexity_fkttestheiss"
    t.float    "complexity_konformitaet"
    t.index ["subproject_id"], name: "index_subsubprojects_on_subproject_id", using: :btree
  end

  create_table "subsystems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_subsystems_on_project_id", using: :btree
  end

  create_table "supplier_suppliertypes", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "suppliertype_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["supplier_id", "suppliertype_id"], name: "index_supplier_suppliertypes_on_supplier_id_and_suppliertype_id", unique: true, using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliertypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "switchgearcombinations", force: :cascade do |t|
    t.string   "name"
    t.string   "standort"
    t.float    "u_feed_power"
    t.float    "u_feed_control"
    t.float    "u_out_power"
    t.float    "u_out_control_high"
    t.float    "u_out_control_low"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "switchgear_id"
    t.index ["switchgear_id"], name: "index_switchgearcombinations_on_switchgear_id", using: :btree
  end

  create_table "switchgearconnections", force: :cascade do |t|
    t.integer  "level"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "topswitchgear_id"
    t.integer  "bottomswitchgear_id"
    t.index ["bottomswitchgear_id"], name: "index_switchgearconnections_on_bottomswitchgear_id", using: :btree
    t.index ["topswitchgear_id", "bottomswitchgear_id"], name: "switchgearconnections_uniqueness", unique: true, using: :btree
    t.index ["topswitchgear_id"], name: "index_switchgearconnections_on_topswitchgear_id", using: :btree
  end

  create_table "switchgears", force: :cascade do |t|
    t.string   "kennung"
    t.text     "leistung"
    t.float    "maxstrom"
    t.float    "brutto"
    t.float    "rabatt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "typ"
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "subsystem_id"
    t.index ["subsystem_id"], name: "index_units_on_subsystem_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wire_suppliers", force: :cascade do |t|
    t.integer  "wire_id"
    t.integer  "supplier_id"
    t.float    "anschlusstableauseite"
    t.float    "anschlussgeraeteseite"
    t.float    "beschriftungkabeleinanschluss"
    t.float    "beschriftungaderneinanschluss"
    t.float    "installationhohlboden"
    t.float    "installationtrasse"
    t.float    "installationrohr"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["wire_id", "supplier_id"], name: "index_wire_suppliers_on_wire_id_and_supplier_id", unique: true, using: :btree
  end

  create_table "wire_wiresuppliers", force: :cascade do |t|
    t.integer  "wire_id"
    t.integer  "wiresupplier_id"
    t.float    "anschlusstableauseite"
    t.float    "anschlussgeraeteseite"
    t.float    "beschriftungkabeleinanschluss"
    t.float    "beschriftungaderneinanschluss"
    t.float    "installationhohlboden"
    t.float    "installationtrasse"
    t.float    "installationrohr"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["wire_id", "wiresupplier_id"], name: "index_wire_wiresuppliers_on_wire_id_and_wiresupplier_id", unique: true, using: :btree
  end

  create_table "wirecaptionprices", force: :cascade do |t|
    t.float    "kostenkabelmitmontagetraeger"
    t.float    "kostenadermitmontagehuelse"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "supplier_id"
    t.index ["supplier_id"], name: "index_wirecaptionprices_on_supplier_id", using: :btree
  end

  create_table "wirecaptionsuppliers", force: :cascade do |t|
    t.string   "name"
    t.float    "kostenkabelmitmontagetraeger"
    t.float    "kostenadermitmontagehuelse"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "wires", force: :cascade do |t|
    t.integer  "aderbeschriftung"
    t.integer  "anzahladern"
    t.string   "kabeltyp"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "wiresuppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "devices", "switchgears"
  add_foreign_key "grobengineerings", "devices"
  add_foreign_key "grobengineerings", "drives", column: "fu_typ_id"
  add_foreign_key "grobengineerings", "iogroups"
  add_foreign_key "grobengineerings", "subsubprojects"
  add_foreign_key "grobengineerings", "subsystems"
  add_foreign_key "grobengineerings", "switchgears", column: "switchgear_motorenabgang_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez1_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez2_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez3_id"
  add_foreign_key "iogroups", "iotypes"
  add_foreign_key "iogroups", "switchgearcombinations"
  add_foreign_key "subprojects", "customers"
  add_foreign_key "subprojects", "projects"
  add_foreign_key "subsubprojects", "subprojects"
  add_foreign_key "subsystems", "projects"
  add_foreign_key "switchgearcombinations", "switchgears"
  add_foreign_key "switchgearconnections", "switchgearcombinations", column: "bottomswitchgear_id"
  add_foreign_key "switchgearconnections", "switchgearcombinations", column: "topswitchgear_id"
  add_foreign_key "units", "subsystems"
  add_foreign_key "wirecaptionprices", "suppliers"
end
