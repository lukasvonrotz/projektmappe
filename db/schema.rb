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

ActiveRecord::Schema.define(version: 20171007072153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assemblies", force: :cascade do |t|
    t.string   "kennung"
    t.string   "artikelnr"
    t.text     "bezeichnung"
    t.integer  "di",          default: 0,   null: false
    t.integer  "do",          default: 0,   null: false
    t.integer  "ai",          default: 0,   null: false
    t.integer  "ao",          default: 0,   null: false
    t.integer  "z",           default: 0,   null: false
    t.integer  "inkr",        default: 0,   null: false
    t.integer  "ssi",         default: 0,   null: false
    t.integer  "sdi",         default: 0,   null: false
    t.integer  "sdo",         default: 0,   null: false
    t.integer  "sai",         default: 0,   null: false
    t.integer  "sao",         default: 0,   null: false
    t.float    "brutto_eur",  default: 0.0, null: false
    t.float    "rabatt",      default: 0.0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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

  create_table "devices", force: :cascade do |t|
    t.text     "definition"
    t.float    "eng_admin",                 default: 0.0, null: false
    t.float    "eng_steuerkonzept",         default: 0.0, null: false
    t.float    "eng_ioliste",               default: 0.0, null: false
    t.float    "eng_elplanung",             default: 0.0, null: false
    t.float    "eng_fktbeschrieb",          default: 0.0, null: false
    t.float    "eng_safetymatrix",          default: 0.0, null: false
    t.float    "eng_software",              default: 0.0, null: false
    t.float    "eng_softwaresafety",        default: 0.0, null: false
    t.float    "eng_bauleitung",            default: 0.0, null: false
    t.float    "eng_parametrierung",        default: 0.0, null: false
    t.float    "eng_signaltest",            default: 0.0, null: false
    t.float    "eng_safetytest",            default: 0.0, null: false
    t.float    "eng_fkttestkalt",           default: 0.0, null: false
    t.float    "eng_fkttestheiss",          default: 0.0, null: false
    t.float    "eng_konformitaet",          default: 0.0, null: false
    t.integer  "ger_beschriftung",          default: 0,   null: false
    t.integer  "ger_sensor",                default: 0,   null: false
    t.integer  "ger_ventil",                default: 0,   null: false
    t.integer  "ger_heizung",               default: 0,   null: false
    t.integer  "ger_m1r",                   default: 0,   null: false
    t.integer  "ger_m2r",                   default: 0,   null: false
    t.integer  "ger_mfu",                   default: 0,   null: false
    t.integer  "ger_wicklung",              default: 0,   null: false
    t.integer  "ger_bremse",                default: 0,   null: false
    t.integer  "ger_geraeteheizung",        default: 0,   null: false
    t.integer  "ger_kommunikation",         default: 0,   null: false
    t.integer  "ger_safety",                default: 0,   null: false
    t.integer  "ger_spsmodul",              default: 0,   null: false
    t.integer  "sig_di",                    default: 0,   null: false
    t.integer  "sig_do",                    default: 0,   null: false
    t.integer  "sig_ai",                    default: 0,   null: false
    t.integer  "sig_ao",                    default: 0,   null: false
    t.integer  "sig_z",                     default: 0,   null: false
    t.integer  "sig_inkr",                  default: 0,   null: false
    t.integer  "sig_ssi",                   default: 0,   null: false
    t.integer  "sig_pb",                    default: 0,   null: false
    t.integer  "sig_sdi",                   default: 0,   null: false
    t.integer  "sig_sdo",                   default: 0,   null: false
    t.integer  "sig_sai",                   default: 0,   null: false
    t.integer  "sig_sao",                   default: 0,   null: false
    t.integer  "sch_anzahl",                default: 0,   null: false
    t.float    "kabelsteuerunglaenge",      default: 0.0, null: false
    t.float    "kabelspeisunglaenge",       default: 0.0, null: false
    t.float    "kabelpotausgleichlaenge",   default: 0.0, null: false
    t.float    "installationtrasselaenge",  default: 0.0, null: false
    t.float    "installationrohrlaenge",    default: 0.0, null: false
    t.float    "installationgeraetelaenge", default: 0.0, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "switchgear_einbau_id"
    t.integer  "wire_steuerung_id"
    t.integer  "wire_speisung_id"
    t.integer  "wire_potausgleich_id"
    t.integer  "elinst_trasse_id"
    t.integer  "elinst_rohr_id"
    t.integer  "elinst_geraete_id"
    t.index ["elinst_geraete_id"], name: "index_devices_on_elinst_geraete_id", using: :btree
    t.index ["elinst_rohr_id"], name: "index_devices_on_elinst_rohr_id", using: :btree
    t.index ["elinst_trasse_id"], name: "index_devices_on_elinst_trasse_id", using: :btree
    t.index ["switchgear_einbau_id"], name: "index_devices_on_switchgear_einbau_id", using: :btree
    t.index ["wire_potausgleich_id"], name: "index_devices_on_wire_potausgleich_id", using: :btree
    t.index ["wire_speisung_id"], name: "index_devices_on_wire_speisung_id", using: :btree
    t.index ["wire_steuerung_id"], name: "index_devices_on_wire_steuerung_id", using: :btree
  end

  create_table "drives", force: :cascade do |t|
    t.string   "kennung"
    t.string   "artikelnr"
    t.text     "bezeichnung"
    t.text     "un"
    t.text     "in"
    t.text     "pn"
    t.string   "bg"
    t.float    "brutto",      default: 0.0, null: false
    t.float    "rabatt",      default: 0.0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "electrical_installations", force: :cascade do |t|
    t.text     "kennung"
    t.text     "leistung"
    t.string   "einheit"
    t.float    "brutto",     default: 0.0, null: false
    t.float    "rabatt",     default: 0.0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "grobengineerings", force: :cascade do |t|
    t.string   "offertposition"
    t.text     "beschreibung"
    t.text     "kommentar"
    t.text     "device_import"
    t.integer  "device_anzahl",               default: 1,   null: false
    t.boolean  "update_necessary"
    t.string   "tagnr"
    t.string   "tagname"
    t.text     "bezeichnung"
    t.text     "bemerkung"
    t.float    "funktion_sw",                 default: 0.0, null: false
    t.float    "kabel_spez1_laenge",          default: 0.0, null: false
    t.float    "kabel_spez2_laenge",          default: 0.0, null: false
    t.float    "kabel_spez3_laenge",          default: 0.0, null: false
    t.string   "sicherheitszone"
    t.string   "lieferant"
    t.float    "spannung",                    default: 0.0, null: false
    t.float    "leistung",                    default: 0.0, null: false
    t.float    "strom",                       default: 0.0, null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "subsubproject_id",                          null: false
    t.integer  "device_id",                                 null: false
    t.integer  "subsystem_id"
    t.integer  "iogroup_id"
    t.integer  "switchgear_motorenabgang_id"
    t.integer  "fu_typ_id"
    t.integer  "wire_spez1_id"
    t.integer  "wire_spez2_id"
    t.integer  "wire_spez3_id"
    t.integer  "offertposition_id"
    t.index ["device_id"], name: "index_grobengineerings_on_device_id", using: :btree
    t.index ["fu_typ_id"], name: "index_grobengineerings_on_fu_typ_id", using: :btree
    t.index ["iogroup_id"], name: "index_grobengineerings_on_iogroup_id", using: :btree
    t.index ["offertposition_id"], name: "index_grobengineerings_on_offertposition_id", using: :btree
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
    t.integer  "switchgearcombination_id", null: false
    t.integer  "iotype_id",                null: false
    t.index ["iotype_id"], name: "index_iogroups_on_iotype_id", using: :btree
    t.index ["switchgearcombination_id"], name: "index_iogroups_on_switchgearcombination_id", using: :btree
  end

  create_table "iogroups_assemblies", id: false, force: :cascade do |t|
    t.integer "iogroup_id"
    t.integer "assembly_id"
    t.index ["iogroup_id", "assembly_id"], name: "index_iogroups_assemblies_on_iogroup_id_and_assembly_id", unique: true, using: :btree
  end

  create_table "iotypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offertpositions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "subsubproject_id", null: false
    t.index ["subsubproject_id"], name: "index_offertpositions_on_subsubproject_id", using: :btree
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
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
    t.integer  "project_id",  null: false
    t.integer  "customer_id", null: false
    t.index ["customer_id"], name: "index_subprojects_on_customer_id", using: :btree
    t.index ["project_id"], name: "index_subprojects_on_project_id", using: :btree
  end

  create_table "subsubprojects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "master",                    default: false, null: false
    t.float    "eurokurs",                  default: 0.0,   null: false
    t.boolean  "proiorechnen",              default: false, null: false
    t.float    "hourrate_admin",            default: 0.0,   null: false
    t.float    "hourrate_steuerkonzept",    default: 0.0,   null: false
    t.float    "hourrate_ioliste",          default: 0.0,   null: false
    t.float    "hourrate_elplanung",        default: 0.0,   null: false
    t.float    "hourrate_fktbeschrieb",     default: 0.0,   null: false
    t.float    "hourrate_safetymatrix",     default: 0.0,   null: false
    t.float    "hourrate_software",         default: 0.0,   null: false
    t.float    "hourrate_softwaresafety",   default: 0.0,   null: false
    t.float    "hourrate_bauleitung",       default: 0.0,   null: false
    t.float    "hourrate_parametrierung",   default: 0.0,   null: false
    t.float    "hourrate_signaltest",       default: 0.0,   null: false
    t.float    "hourrate_safetytest",       default: 0.0,   null: false
    t.float    "hourrate_fkttestkalt",      default: 0.0,   null: false
    t.float    "hourrate_fkttestheiss",     default: 0.0,   null: false
    t.float    "hourrate_konformitaet",     default: 0.0,   null: false
    t.float    "complexity_admin",          default: 1.0,   null: false
    t.float    "complexity_steuerkonzept",  default: 1.0,   null: false
    t.float    "complexity_ioliste",        default: 1.0,   null: false
    t.float    "complexity_elplanung",      default: 1.0,   null: false
    t.float    "complexity_fktbeschrieb",   default: 1.0,   null: false
    t.float    "complexity_safetymatrix",   default: 1.0,   null: false
    t.float    "complexity_software",       default: 1.0,   null: false
    t.float    "complexity_softwaresafety", default: 1.0,   null: false
    t.float    "complexity_bauleitung",     default: 1.0,   null: false
    t.float    "complexity_parametrierung", default: 1.0,   null: false
    t.float    "complexity_signaltest",     default: 1.0,   null: false
    t.float    "complexity_safetytest",     default: 1.0,   null: false
    t.float    "complexity_fkttestkalt",    default: 1.0,   null: false
    t.float    "complexity_fkttestheiss",   default: 1.0,   null: false
    t.float    "complexity_konformitaet",   default: 1.0,   null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "subproject_id",                             null: false
    t.integer  "wiresupplier_id",                           null: false
    t.integer  "wirecaptionsupplier_id",                    null: false
    t.index ["subproject_id"], name: "index_subsubprojects_on_subproject_id", using: :btree
    t.index ["wirecaptionsupplier_id"], name: "index_subsubprojects_on_wirecaptionsupplier_id", using: :btree
    t.index ["wiresupplier_id"], name: "index_subsubprojects_on_wiresupplier_id", using: :btree
  end

  create_table "subsystems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id", null: false
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
    t.float    "u_feed_power",       default: 0.0, null: false
    t.float    "u_feed_control",     default: 0.0, null: false
    t.float    "u_out_power",        default: 0.0, null: false
    t.float    "u_out_control_high", default: 0.0, null: false
    t.float    "u_out_control_low",  default: 0.0, null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "switchgear_id",                    null: false
    t.index ["switchgear_id"], name: "index_switchgearcombinations_on_switchgear_id", using: :btree
  end

  create_table "switchgearconnections", force: :cascade do |t|
    t.integer  "level",               default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "topswitchgear_id",                null: false
    t.integer  "bottomswitchgear_id",             null: false
    t.index ["bottomswitchgear_id"], name: "index_switchgearconnections_on_bottomswitchgear_id", using: :btree
    t.index ["topswitchgear_id", "bottomswitchgear_id"], name: "switchgearconnections_uniqueness", unique: true, using: :btree
    t.index ["topswitchgear_id"], name: "index_switchgearconnections_on_topswitchgear_id", using: :btree
  end

  create_table "switchgears", force: :cascade do |t|
    t.string   "kennung"
    t.text     "leistung"
    t.float    "maxstrom",   default: 0.0, null: false
    t.float    "brutto",     default: 0.0, null: false
    t.float    "rabatt",     default: 0.0, null: false
    t.integer  "typ",        default: 0,   null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "subsystem_id", null: false
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
    t.integer  "wire_id",                                     null: false
    t.integer  "supplier_id",                                 null: false
    t.float    "anschlusstableauseite",         default: 0.0, null: false
    t.float    "anschlussgeraeteseite",         default: 0.0, null: false
    t.float    "beschriftungkabeleinanschluss", default: 0.0, null: false
    t.float    "beschriftungaderneinanschluss", default: 0.0, null: false
    t.float    "installationhohlboden",         default: 0.0, null: false
    t.float    "installationtrasse",            default: 0.0, null: false
    t.float    "installationrohr",              default: 0.0, null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["wire_id", "supplier_id"], name: "index_wire_suppliers_on_wire_id_and_supplier_id", unique: true, using: :btree
  end

  create_table "wirecaptionprices", force: :cascade do |t|
    t.float    "kostenkabelmitmontagetraeger", default: 0.0, null: false
    t.float    "kostenadermitmontagehuelse",   default: 0.0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "supplier_id",                                null: false
    t.index ["supplier_id"], name: "index_wirecaptionprices_on_supplier_id", using: :btree
  end

  create_table "wires", force: :cascade do |t|
    t.integer  "aderbeschriftung"
    t.integer  "anzahladern",      default: 0, null: false
    t.string   "kabeltyp"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_foreign_key "devices", "electrical_installations", column: "elinst_geraete_id"
  add_foreign_key "devices", "electrical_installations", column: "elinst_rohr_id"
  add_foreign_key "devices", "electrical_installations", column: "elinst_trasse_id"
  add_foreign_key "devices", "switchgears", column: "switchgear_einbau_id"
  add_foreign_key "devices", "wires", column: "wire_potausgleich_id"
  add_foreign_key "devices", "wires", column: "wire_speisung_id"
  add_foreign_key "devices", "wires", column: "wire_steuerung_id"
  add_foreign_key "grobengineerings", "devices"
  add_foreign_key "grobengineerings", "drives", column: "fu_typ_id"
  add_foreign_key "grobengineerings", "iogroups"
  add_foreign_key "grobengineerings", "offertpositions"
  add_foreign_key "grobengineerings", "subsystems"
  add_foreign_key "grobengineerings", "switchgears", column: "switchgear_motorenabgang_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez1_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez2_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez3_id"
  add_foreign_key "iogroups", "iotypes"
  add_foreign_key "iogroups", "switchgearcombinations"
  add_foreign_key "offertpositions", "subsubprojects"
  add_foreign_key "subprojects", "customers"
  add_foreign_key "subprojects", "projects"
  add_foreign_key "subsubprojects", "subprojects"
  add_foreign_key "subsubprojects", "suppliers", column: "wirecaptionsupplier_id"
  add_foreign_key "subsubprojects", "suppliers", column: "wiresupplier_id"
  add_foreign_key "subsystems", "projects"
  add_foreign_key "switchgearcombinations", "switchgears"
  add_foreign_key "switchgearconnections", "switchgearcombinations", column: "bottomswitchgear_id"
  add_foreign_key "switchgearconnections", "switchgearcombinations", column: "topswitchgear_id"
  add_foreign_key "units", "subsystems"
  add_foreign_key "wirecaptionprices", "suppliers"
end
