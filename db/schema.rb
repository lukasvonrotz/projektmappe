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

ActiveRecord::Schema.define(version: 20171031124740) do

  create_table "assemblies", force: :cascade do |t|
    t.string   "kennung"
    t.string   "artikelnr"
    t.text     "bezeichnung",       limit: 2147483647
    t.integer  "di",                                   default: 0,   null: false
    t.integer  "do",                                   default: 0,   null: false
    t.integer  "ai",                                   default: 0,   null: false
    t.integer  "ao",                                   default: 0,   null: false
    t.integer  "z",                                    default: 0,   null: false
    t.integer  "inkr",                                 default: 0,   null: false
    t.integer  "ssi",                                  default: 0,   null: false
    t.integer  "sdi",                                  default: 0,   null: false
    t.integer  "sdo",                                  default: 0,   null: false
    t.integer  "sai",                                  default: 0,   null: false
    t.integer  "sao",                                  default: 0,   null: false
    t.float    "brutto_eur",                           default: 0.0, null: false
    t.float    "rabatt",                               default: 0.0, null: false
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.integer  "kanal_startnummer",                    default: 1,   null: false
    t.string   "hersteller"
    t.index ["kennung"], name: "assemblies_kennung_unique", unique: true
  end

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "kundennummer_neu"
    t.string   "kundennummer_alt"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "definition"
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
    t.index ["definition"], name: "devices_definition_unique", unique: true
    t.index ["elinst_geraete_id"], name: "index_devices_on_elinst_geraete_id"
    t.index ["elinst_rohr_id"], name: "index_devices_on_elinst_rohr_id"
    t.index ["elinst_trasse_id"], name: "index_devices_on_elinst_trasse_id"
    t.index ["switchgear_einbau_id"], name: "index_devices_on_switchgear_einbau_id"
    t.index ["wire_potausgleich_id"], name: "index_devices_on_wire_potausgleich_id"
    t.index ["wire_speisung_id"], name: "index_devices_on_wire_speisung_id"
    t.index ["wire_steuerung_id"], name: "index_devices_on_wire_steuerung_id"
  end

  create_table "drive_suppliers", force: :cascade do |t|
    t.integer  "drive_id",                  null: false
    t.integer  "supplier_id",               null: false
    t.float    "brutto",      default: 0.0, null: false
    t.float    "rabatt",      default: 0.0, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["drive_id", "supplier_id"], name: "drive_supplier_unique", unique: true
  end

  create_table "drives", force: :cascade do |t|
    t.string   "kennung"
    t.string   "artikelnr"
    t.text     "bezeichnung", limit: 2147483647
    t.text     "un",          limit: 2147483647
    t.text     "in",          limit: 2147483647
    t.text     "pn",          limit: 2147483647
    t.string   "bg"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "hersteller"
    t.index ["kennung"], name: "drives_kennung_unique", unique: true
  end

  create_table "electrical_installation_suppliers", force: :cascade do |t|
    t.integer  "electrical_installation_id",               null: false
    t.integer  "supplier_id",                              null: false
    t.float    "brutto",                     default: 0.0, null: false
    t.float    "rabatt",                     default: 0.0, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.index ["electrical_installation_id", "supplier_id"], name: "electrical_installation_supplier_unique", unique: true
  end

  create_table "electrical_installations", force: :cascade do |t|
    t.string   "kennung"
    t.text     "leistung",   limit: 2147483647
    t.string   "einheit"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["kennung"], name: "electrical_installations_kennung_unique", unique: true
  end

  create_table "grobengineerings", force: :cascade do |t|
    t.text     "beschreibung",                     limit: 2147483647
    t.text     "kommentar",                        limit: 2147483647
    t.text     "device_import",                    limit: 2147483647
    t.integer  "device_anzahl",                                       default: 1,   null: false
    t.boolean  "update_necessary"
    t.text     "klartext",                         limit: 2147483647
    t.text     "bemerkung",                        limit: 2147483647
    t.float    "funktion_sw",                                         default: 0.0, null: false
    t.float    "kabel_spez1_laenge",                                  default: 0.0, null: false
    t.float    "kabel_spez2_laenge",                                  default: 0.0, null: false
    t.float    "kabel_spez3_laenge",                                  default: 0.0, null: false
    t.string   "sicherheitszone"
    t.string   "lieferant"
    t.float    "spannung",                                            default: 0.0, null: false
    t.float    "leistung",                                            default: 0.0, null: false
    t.float    "strom",                                               default: 0.0, null: false
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "subsubproject_id",                                                  null: false
    t.integer  "device_id",                                                         null: false
    t.integer  "subsystem_id"
    t.integer  "iogroup_id"
    t.integer  "switchgear_motorenabgang_id"
    t.integer  "fu_typ_id"
    t.integer  "wire_spez1_id"
    t.integer  "wire_spez2_id"
    t.integer  "wire_spez3_id"
    t.integer  "offertposition_id",                                                 null: false
    t.integer  "schaltschrank_preisberechnung_id"
    t.string   "tag_anlage"
    t.string   "tag_objekt"
    t.string   "tag_nummer"
    t.string   "brake"
    t.integer  "unit_id"
    t.string   "hwdevice_manufact"
    t.string   "hwdevice_typecode"
    t.string   "hwdevice_linkdatasheet"
    t.float    "motor_rpm",                                           default: 0.0, null: false
    t.float    "motor_cosphi",                                        default: 0.0, null: false
    t.string   "motor_contype"
    t.string   "motor_encoder_fc"
    t.string   "hwdevice_location"
    t.string   "hwdevice_inst_phase"
    t.string   "bmk_plant"
    t.string   "bmk_location"
    t.string   "bmk_number"
    t.integer  "status_lettering",                                    default: 0,   null: false
    t.integer  "status_electric_diag",                                default: 0,   null: false
    t.text     "history",                          limit: 2147483647
    t.string   "hwdevice_typenr_int"
    t.index ["device_id"], name: "index_grobengineerings_on_device_id"
    t.index ["fu_typ_id"], name: "index_grobengineerings_on_fu_typ_id"
    t.index ["iogroup_id"], name: "index_grobengineerings_on_iogroup_id"
    t.index ["offertposition_id"], name: "index_grobengineerings_on_offertposition_id"
    t.index ["schaltschrank_preisberechnung_id"], name: "index_grobengineerings_on_schaltschrank_preisberechnung_id"
    t.index ["subsubproject_id"], name: "index_grobengineerings_on_subsubproject_id"
    t.index ["subsystem_id"], name: "index_grobengineerings_on_subsystem_id"
    t.index ["switchgear_motorenabgang_id"], name: "index_grobengineerings_on_switchgear_motorenabgang_id"
    t.index ["unit_id"], name: "index_grobengineerings_on_unit_id"
    t.index ["wire_spez1_id"], name: "index_grobengineerings_on_wire_spez1_id"
    t.index ["wire_spez2_id"], name: "index_grobengineerings_on_wire_spez2_id"
    t.index ["wire_spez3_id"], name: "index_grobengineerings_on_wire_spez3_id"
  end

  create_table "histories", force: :cascade do |t|
    t.datetime "datum"
    t.text     "ereignis",      limit: 2147483647
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "subproject_id",                    null: false
    t.index ["subproject_id"], name: "index_histories_on_subproject_id"
  end

  create_table "infos", force: :cascade do |t|
    t.datetime "datum"
    t.text     "quelle",        limit: 2147483647
    t.text     "info",          limit: 2147483647
    t.text     "querverweis",   limit: 2147483647
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "subproject_id",                    null: false
    t.index ["subproject_id"], name: "index_infos_on_subproject_id"
  end

  create_table "iochannels", force: :cascade do |t|
    t.integer  "kanalnummer",         default: 0, null: false
    t.string   "channeltype"
    t.string   "address_suffix"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "iogroupcomponent_id",             null: false
    t.index ["iogroupcomponent_id"], name: "index_iochannels_on_iogroupcomponent_id"
    t.index ["kanalnummer", "channeltype", "iogroupcomponent_id"], name: "kanalnummer_typ_iogroupcomponent_uniqueness", unique: true
  end

  create_table "iogroupcomponents", force: :cascade do |t|
    t.string   "name"
    t.integer  "steckplatznummer", default: 0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "assembly_id",                  null: false
    t.integer  "iogroup_id",                   null: false
    t.index ["assembly_id"], name: "index_iogroupcomponents_on_assembly_id"
    t.index ["iogroup_id", "steckplatznummer"], name: "iogroup_steckplatz_unique", unique: true
    t.index ["iogroup_id"], name: "index_iogroupcomponents_on_iogroup_id"
  end

  create_table "iogroups", force: :cascade do |t|
    t.string   "name"
    t.string   "profibus_address"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "switchgearcombination_id", null: false
    t.integer  "iotype_id",                null: false
    t.string   "address_prefix"
    t.index ["iotype_id"], name: "index_iogroups_on_iotype_id"
    t.index ["name", "switchgearcombination_id"], name: "name_switchgearcombination_uniqueness", unique: true
    t.index ["switchgearcombination_id"], name: "index_iogroups_on_switchgearcombination_id"
  end

  create_table "iosignalenginfos", force: :cascade do |t|
    t.text     "pendenz",                      limit: 2147483647
    t.datetime "pendenz_datum"
    t.string   "pendenz_wer"
    t.text     "pendenz_antwort",              limit: 2147483647
    t.datetime "pendenz_antwort_datum"
    t.string   "pendenz_antwort_wer"
    t.text     "frage",                        limit: 2147483647
    t.datetime "frage_datum"
    t.string   "frage_wer"
    t.text     "frage_antwort",                limit: 2147483647
    t.datetime "frage_antwort_datum"
    t.string   "frage_antwort_wer"
    t.text     "sw_instruction",               limit: 2147483647
    t.datetime "sw_instruction_datum"
    t.string   "sw_instruction_wer"
    t.text     "sw_instruction_antwort",       limit: 2147483647
    t.datetime "sw_instruction_antwort_datum"
    t.string   "sw_instruction_antwort_wer"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "iosignal_id",                                     null: false
    t.index ["iosignal_id"], name: "index_iosignalenginfos_on_iosignal_id"
  end

  create_table "iosignalibninfos", force: :cascade do |t|
    t.string   "signaltest_feld"
    t.string   "signaltest_sw"
    t.string   "signaltest_hmi"
    t.string   "signaltest_event"
    t.datetime "signaltest_ok_datum"
    t.string   "signaltest_ok_wer"
    t.text     "bemerkungen",         limit: 2147483647
    t.text     "todo",                limit: 2147483647
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "iosignal_id",                            null: false
    t.index ["iosignal_id"], name: "index_iosignalibninfos_on_iosignal_id"
  end

  create_table "iosignals", force: :cascade do |t|
    t.string   "tagname_suffix"
    t.string   "pendenz"
    t.text     "signal_beschreibung",       limit: 2147483647
    t.string   "signal_phys"
    t.string   "signal_dig_aktiv_text"
    t.float    "signal_ana_range_min",                         default: 0.0, null: false
    t.float    "signal_ana_range_max",                         default: 0.0, null: false
    t.integer  "signal_ana_range_decimals",                    default: 0,   null: false
    t.string   "signal_ana_range_unit",                        default: ""
    t.integer  "bus",                                          default: 0,   null: false
    t.integer  "di",                                           default: 0,   null: false
    t.integer  "do",                                           default: 0,   null: false
    t.integer  "ai",                                           default: 0,   null: false
    t.integer  "ao",                                           default: 0,   null: false
    t.integer  "z",                                            default: 0,   null: false
    t.integer  "inkr",                                         default: 0,   null: false
    t.integer  "ssi",                                          default: 0,   null: false
    t.integer  "safety",                                       default: 0,   null: false
    t.integer  "ex",                                           default: 0,   null: false
    t.string   "sicherheitsgruppe"
    t.string   "info1"
    t.string   "info2"
    t.string   "info3"
    t.string   "info4"
    t.string   "info5"
    t.string   "sw_datentyp"
    t.string   "sw_event_message"
    t.string   "sw_event_prio"
    t.string   "sw_event_normal_state"
    t.string   "sw_trend"
    t.string   "sw_info1"
    t.string   "sw_info2"
    t.string   "sw_info3"
    t.integer  "iochannel_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "grobengineering_id",                                         null: false
    t.index ["grobengineering_id"], name: "index_iosignals_on_grobengineering_id"
    t.index ["iochannel_id"], name: "index_iosignals_on_iochannel_id"
  end

  create_table "iotypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "iotypes_name_unique", unique: true
  end

  create_table "offer_offertpositions", force: :cascade do |t|
    t.integer  "offer_id",                           null: false
    t.integer  "offertposition_id",                  null: false
    t.float    "device_anzahl",        default: 0.0, null: false
    t.float    "eng_elplanung",        default: 0.0, null: false
    t.float    "eng_planung_sw",       default: 0.0, null: false
    t.float    "eng_ibn_bauleitung",   default: 0.0, null: false
    t.float    "sps_total_brutto",     default: 0.0, null: false
    t.float    "sps_total_netto",      default: 0.0, null: false
    t.float    "io_et_total_brutto",   default: 0.0, null: false
    t.float    "io_et_total_netto",    default: 0.0, null: false
    t.float    "io_pilz_total_brutto", default: 0.0, null: false
    t.float    "io_pilz_total_netto",  default: 0.0, null: false
    t.float    "fu_total_brutto",      default: 0.0, null: false
    t.float    "fu_total_netto",       default: 0.0, null: false
    t.float    "sch_total_brutto",     default: 0.0, null: false
    t.float    "sch_total_netto",      default: 0.0, null: false
    t.float    "elinst_total_brutto",  default: 0.0, null: false
    t.float    "elinst_total_netto",   default: 0.0, null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["offer_id", "offertposition_id"], name: "offer_offertposition_unique", unique: true
  end

  create_table "offers", force: :cascade do |t|
    t.datetime "datum"
    t.text     "beschreibung",     limit: 2147483647
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "subsubproject_id",                    null: false
    t.integer  "user_id",                             null: false
    t.index ["subsubproject_id"], name: "index_offers_on_subsubproject_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "offertpositions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "subsubproject_id", null: false
    t.index ["name", "subsubproject_id"], name: "name_subsubproject_uniqueness", unique: true
    t.index ["subsubproject_id"], name: "index_offertpositions_on_subsubproject_id"
  end

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "by_project_and_user", unique: true
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
    t.index ["subproject_id", "user_id"], name: "subproject_users_unique", unique: true
  end

  create_table "subprojects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                                                    null: false
    t.datetime "updated_at",                                                    null: false
    t.integer  "project_id",                                                    null: false
    t.integer  "customer_id",                                                   null: false
    t.string   "trennzeichen"
    t.integer  "max_zeichen_klartext_grobeng", default: 20,                     null: false
    t.integer  "max_zeichen_klartext_signal",  default: 20,                     null: false
    t.string   "info1_text",                   default: "Freie Beschreibung 1"
    t.string   "info2_text",                   default: "Freie Beschreibung 2"
    t.string   "info3_text",                   default: "Freie Beschreibung 3"
    t.string   "info4_text",                   default: "Freie Beschreibung 4"
    t.string   "info5_text",                   default: "Freie Beschreibung 5"
    t.string   "projektnummer_prola"
    t.index ["customer_id"], name: "index_subprojects_on_customer_id"
    t.index ["project_id"], name: "index_subprojects_on_project_id"
  end

  create_table "subsubprojects", force: :cascade do |t|
    t.string   "name"
    t.boolean  "master",                            default: false, null: false
    t.float    "eurokurs",                          default: 0.0,   null: false
    t.boolean  "proiorechnen",                      default: false, null: false
    t.float    "hourrate_admin",                    default: 0.0,   null: false
    t.float    "hourrate_steuerkonzept",            default: 0.0,   null: false
    t.float    "hourrate_ioliste",                  default: 0.0,   null: false
    t.float    "hourrate_elplanung",                default: 0.0,   null: false
    t.float    "hourrate_fktbeschrieb",             default: 0.0,   null: false
    t.float    "hourrate_safetymatrix",             default: 0.0,   null: false
    t.float    "hourrate_software",                 default: 0.0,   null: false
    t.float    "hourrate_softwaresafety",           default: 0.0,   null: false
    t.float    "hourrate_bauleitung",               default: 0.0,   null: false
    t.float    "hourrate_parametrierung",           default: 0.0,   null: false
    t.float    "hourrate_signaltest",               default: 0.0,   null: false
    t.float    "hourrate_safetytest",               default: 0.0,   null: false
    t.float    "hourrate_fkttestkalt",              default: 0.0,   null: false
    t.float    "hourrate_fkttestheiss",             default: 0.0,   null: false
    t.float    "hourrate_konformitaet",             default: 0.0,   null: false
    t.float    "complexity_admin",                  default: 1.0,   null: false
    t.float    "complexity_steuerkonzept",          default: 1.0,   null: false
    t.float    "complexity_ioliste",                default: 1.0,   null: false
    t.float    "complexity_elplanung",              default: 1.0,   null: false
    t.float    "complexity_fktbeschrieb",           default: 1.0,   null: false
    t.float    "complexity_safetymatrix",           default: 1.0,   null: false
    t.float    "complexity_software",               default: 1.0,   null: false
    t.float    "complexity_softwaresafety",         default: 1.0,   null: false
    t.float    "complexity_bauleitung",             default: 1.0,   null: false
    t.float    "complexity_parametrierung",         default: 1.0,   null: false
    t.float    "complexity_signaltest",             default: 1.0,   null: false
    t.float    "complexity_safetytest",             default: 1.0,   null: false
    t.float    "complexity_fkttestkalt",            default: 1.0,   null: false
    t.float    "complexity_fkttestheiss",           default: 1.0,   null: false
    t.float    "complexity_konformitaet",           default: 1.0,   null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "subproject_id",                                     null: false
    t.integer  "wiresupplier_id",                                   null: false
    t.integer  "wirecaptionsupplier_id",                            null: false
    t.integer  "electricalinstallationsupplier_id",                 null: false
    t.integer  "drivesupplier_id",                                  null: false
    t.integer  "switchgearsupplier_id",                             null: false
    t.index ["drivesupplier_id"], name: "index_subsubprojects_on_drivesupplier_id"
    t.index ["electricalinstallationsupplier_id"], name: "index_subsubprojects_on_electricalinstallationsupplier_id"
    t.index ["subproject_id"], name: "index_subsubprojects_on_subproject_id"
    t.index ["switchgearsupplier_id"], name: "index_subsubprojects_on_switchgearsupplier_id"
    t.index ["wirecaptionsupplier_id"], name: "index_subsubprojects_on_wirecaptionsupplier_id"
    t.index ["wiresupplier_id"], name: "index_subsubprojects_on_wiresupplier_id"
  end

  create_table "subsystems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id", null: false
    t.index ["project_id"], name: "index_subsystems_on_project_id"
  end

  create_table "supplier_suppliertypes", force: :cascade do |t|
    t.integer  "supplier_id"
    t.integer  "suppliertype_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["supplier_id", "suppliertype_id"], name: "supplier_suppliertype_unique", unique: true
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "suppliers_name_unique", unique: true
  end

  create_table "suppliertypes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "switchgear_suppliers", force: :cascade do |t|
    t.integer  "switchgear_id",               null: false
    t.integer  "supplier_id",                 null: false
    t.float    "brutto",        default: 0.0, null: false
    t.float    "rabatt",        default: 0.0, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["switchgear_id", "supplier_id"], name: "switchgear_supplier_unique", unique: true
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
    t.index ["name"], name: "switchgearcombinations_name_unique", unique: true
    t.index ["switchgear_id"], name: "index_switchgearcombinations_on_switchgear_id"
  end

  create_table "switchgearconnections", force: :cascade do |t|
    t.integer  "level",               default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "topswitchgear_id",                null: false
    t.integer  "bottomswitchgear_id",             null: false
    t.index ["bottomswitchgear_id"], name: "index_switchgearconnections_on_bottomswitchgear_id"
    t.index ["topswitchgear_id", "bottomswitchgear_id"], name: "switchgearconnections_uniqueness", unique: true
    t.index ["topswitchgear_id"], name: "index_switchgearconnections_on_topswitchgear_id"
  end

  create_table "switchgears", force: :cascade do |t|
    t.string   "kennung"
    t.text     "leistung",   limit: 2147483647
    t.float    "maxstrom",                      default: 0.0, null: false
    t.integer  "typ",                           default: 0,   null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.index ["kennung"], name: "switchgears_kennung_unique", unique: true
  end

  create_table "units", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "subsystem_id", null: false
    t.index ["subsystem_id"], name: "index_units_on_subsystem_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                   default: "", null: false
    t.string   "encrypted_password",                      default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                           default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "anzahl_eintraege_assemblies",             default: 10, null: false
    t.integer  "anzahl_eintraege_customers",              default: 10, null: false
    t.integer  "anzahl_eintraege_devices",                default: 10, null: false
    t.integer  "anzahl_eintraege_drives",                 default: 10, null: false
    t.integer  "anzahl_eintraege_elinst",                 default: 10, null: false
    t.integer  "anzahl_eintraege_grobengineerings",       default: 10, null: false
    t.integer  "anzahl_eintraege_iogroups",               default: 10, null: false
    t.integer  "anzahl_eintraege_iosignals",              default: 10, null: false
    t.integer  "anzahl_eintraege_subprojects",            default: 10, null: false
    t.integer  "anzahl_eintraege_switchgears",            default: 10, null: false
    t.integer  "anzahl_eintraege_switchgearcombinations", default: 10, null: false
    t.integer  "anzahl_eintraege_wires",                  default: 10, null: false
    t.integer  "sortierung_assemblies",                   default: 0,  null: false
    t.integer  "sortierung_customers",                    default: 0,  null: false
    t.integer  "sortierung_devices",                      default: 0,  null: false
    t.integer  "sortierung_drives",                       default: 0,  null: false
    t.integer  "sortierung_elinst",                       default: 0,  null: false
    t.integer  "sortierung_grobengineerings",             default: 0,  null: false
    t.integer  "sortierung_iogroups",                     default: 0,  null: false
    t.integer  "sortierung_iosignals",                    default: 0,  null: false
    t.integer  "sortierung_subprojects",                  default: 0,  null: false
    t.integer  "sortierung_switchgears",                  default: 0,  null: false
    t.integer  "sortierung_switchgearcombinations",       default: 0,  null: false
    t.integer  "sortierung_wires",                        default: 0,  null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
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
    t.index ["wire_id", "supplier_id"], name: "wire_supplier_unique", unique: true
  end

  create_table "wirecaptionprices", force: :cascade do |t|
    t.float    "kostenkabelmitmontagetraeger", default: 0.0, null: false
    t.float    "kostenadermitmontagehuelse",   default: 0.0, null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "supplier_id",                                null: false
    t.index ["supplier_id"], name: "index_wirecaptionprices_on_supplier_id"
    t.index ["supplier_id"], name: "wirecaptionprices_supplier_unique", unique: true
  end

  create_table "wires", force: :cascade do |t|
    t.integer  "aderbeschriftung", default: 0, null: false
    t.integer  "anzahladern",      default: 0, null: false
    t.string   "kabeltyp"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["kabeltyp"], name: "wires_kabeltyp_unique", unique: true
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
  add_foreign_key "grobengineerings", "subsubprojects"
  add_foreign_key "grobengineerings", "subsystems"
  add_foreign_key "grobengineerings", "switchgearcombinations", column: "schaltschrank_preisberechnung_id"
  add_foreign_key "grobengineerings", "switchgears", column: "switchgear_motorenabgang_id"
  add_foreign_key "grobengineerings", "units"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez1_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez2_id"
  add_foreign_key "grobengineerings", "wires", column: "wire_spez3_id"
  add_foreign_key "histories", "subprojects"
  add_foreign_key "infos", "subprojects"
  add_foreign_key "iochannels", "iogroupcomponents"
  add_foreign_key "iogroupcomponents", "assemblies"
  add_foreign_key "iogroupcomponents", "iogroups"
  add_foreign_key "iogroups", "iotypes"
  add_foreign_key "iogroups", "switchgearcombinations"
  add_foreign_key "iosignalenginfos", "iosignals"
  add_foreign_key "iosignalibninfos", "iosignals"
  add_foreign_key "iosignals", "grobengineerings"
  add_foreign_key "offers", "subsubprojects"
  add_foreign_key "offers", "users"
  add_foreign_key "offertpositions", "subsubprojects"
  add_foreign_key "subprojects", "customers"
  add_foreign_key "subprojects", "projects"
  add_foreign_key "subsubprojects", "subprojects"
  add_foreign_key "subsubprojects", "suppliers", column: "drivesupplier_id"
  add_foreign_key "subsubprojects", "suppliers", column: "electricalinstallationsupplier_id"
  add_foreign_key "subsubprojects", "suppliers", column: "switchgearsupplier_id"
  add_foreign_key "subsubprojects", "suppliers", column: "wirecaptionsupplier_id"
  add_foreign_key "subsubprojects", "suppliers", column: "wiresupplier_id"
  add_foreign_key "subsystems", "projects"
  add_foreign_key "switchgearcombinations", "switchgears"
  add_foreign_key "switchgearconnections", "switchgearcombinations", column: "bottomswitchgear_id"
  add_foreign_key "switchgearconnections", "switchgearcombinations", column: "topswitchgear_id"
  add_foreign_key "units", "subsystems"
  add_foreign_key "wirecaptionprices", "suppliers"
end
