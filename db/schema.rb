# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150419033605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "alert_images", force: :cascade do |t|
    t.integer  "alert_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "uploaded_image_file_name"
    t.string   "uploaded_image_content_type"
    t.integer  "uploaded_image_file_size"
    t.datetime "uploaded_image_updated_at"
  end

  add_index "alert_images", ["alert_id"], name: "index_alert_images_on_alert_id", using: :btree

  create_table "alert_rankings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "alert_id"
    t.boolean  "ranking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "alert_rankings", ["user_id", "alert_id"], name: "index_alert_rankings_on_user_id_and_alert_id", unique: true, using: :btree

  create_table "alerts", force: :cascade do |t|
    t.float    "lat"
    t.float    "lon"
    t.integer  "magnitude"
    t.string   "description"
    t.float    "area"
    t.time     "created"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "country_id"
    t.string   "alert_type"
  end

  add_index "alerts", ["user_id"], name: "index_alerts_on_user_id", using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "iso"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth_token"
    t.string   "role"
    t.string   "cell_phone"
    t.boolean  "message",                default: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
    t.hstore   "config"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "alert_images", "alerts"
  add_foreign_key "alerts", "users"
end
