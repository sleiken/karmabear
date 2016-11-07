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


ActiveRecord::Schema.define(version: 20161107033223) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charities", force: :cascade do |t|
    t.string   "name",        null: false
    t.float    "lat",         null: false
    t.float    "lng",         null: false
    t.string   "address",     null: false, array: true
    t.text     "description"
    t.string   "phone"
    t.string   "url"
    t.integer  "manager_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_url"
  end

  create_table "charity_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "charity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "donations", force: :cascade do |t|
    t.integer  "quantity_given", default: 0
    t.integer  "need_id"
    t.integer  "giver_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",          null: false
    t.text     "description"
    t.datetime "start"
    t.datetime "end"
    t.integer  "givers_needed"
    t.integer  "charity_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "givers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "points",                 default: 0
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "gid"
    t.string   "image_url"
    t.index ["email"], name: "index_givers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_givers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "lat",        null: false
    t.string   "lng",        null: false
    t.integer  "giver_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "charity_id",                          null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_managers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_managers_on_reset_password_token", unique: true, using: :btree
  end

  create_table "needs", force: :cascade do |t|
    t.string   "name",            null: false
    t.text     "description"
    t.integer  "quantity_needed"
    t.string   "status"
    t.integer  "charity_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "giver_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "pending_hours"
    t.integer  "approved_hours"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "charity_id"
    t.integer  "giver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
