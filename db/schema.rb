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

ActiveRecord::Schema.define(version: 2021_09_05_043545) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caisses", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "acte"
    t.string "payement"
    t.integer "montant"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comptabilites", force: :cascade do |t|
    t.string "nom"
    t.string "prenom"
    t.string "acte"
    t.string "payment"
    t.integer "montant"
    t.string "telephone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "ipm_id"
    t.bigint "type_paiment_id"
    t.index ["ipm_id"], name: "index_comptabilites_on_ipm_id"
    t.index ["type_paiment_id"], name: "index_comptabilites_on_type_paiment_id"
  end

  create_table "ipms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_paiments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "roles"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comptabilites", "ipms"
  add_foreign_key "comptabilites", "type_paiments"
end
