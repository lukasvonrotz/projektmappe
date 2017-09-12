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

ActiveRecord::Schema.define(version: 20170912143537) do

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

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "subprojects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
    t.index ["customer_id"], name: "index_subprojects_on_customer_id", using: :btree
  end

  create_table "subsystems", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
    t.index ["project_id"], name: "index_subsystems_on_project_id", using: :btree
  end

  create_table "switchgears", force: :cascade do |t|
    t.string   "kennung"
    t.text     "leistung"
    t.float    "maxstrom"
    t.float    "brutto"
    t.float    "rabatt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "subprojects", "customers"
  add_foreign_key "subsystems", "projects"
  add_foreign_key "units", "subsystems"
end
