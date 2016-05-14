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

ActiveRecord::Schema.define(version: 20160510171110) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "add_note_to_donations", force: :cascade do |t|
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "donation_images", force: :cascade do |t|
    t.integer  "donation_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
  end

  add_index "donation_images", ["donation_id"], name: "index_donation_images_on_donation_id", using: :btree

  create_table "donation_items", force: :cascade do |t|
    t.string   "type_description"
    t.integer  "quantity"
    t.string   "unit"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "donation_id"
  end

  add_index "donation_items", ["donation_id"], name: "index_donation_items_on_donation_id", using: :btree

  create_table "donation_meta", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "donation_id"
  end

  create_table "donation_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "donation_types", force: :cascade do |t|
    t.string   "type_description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "quantity"
    t.string   "unit"
  end

  create_table "donations", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "donor_id"
    t.integer  "driver_id"
    t.integer  "recipient_id"
    t.integer  "status_id"
    t.string   "description"
    t.string   "note"
  end

  create_table "donor_addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "street_address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "donor_id"
    t.boolean  "default",            default: false
  end

  add_index "donor_addresses", ["donor_id"], name: "index_donor_addresses_on_donor_id", using: :btree

  create_table "dropoffs", force: :cascade do |t|
    t.datetime "estimated"
    t.datetime "actual"
    t.decimal  "latitude",           precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",          precision: 15, scale: 10, default: 0.0
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.integer  "donation_id"
    t.string   "street_address"
    t.string   "street_address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "dropoffstatus_id"
    t.string   "country_code",                                 default: "+1"
  end

  add_index "dropoffs", ["donation_id"], name: "index_dropoffs_on_donation_id", using: :btree
  add_index "dropoffs", ["dropoffstatus_id"], name: "index_dropoffs_on_dropoffstatus_id", using: :btree

  create_table "dropoffstatuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organization_addresses", force: :cascade do |t|
    t.integer  "organization_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "street_address"
    t.string   "street_address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "default"
  end

  add_index "organization_addresses", ["organization_id"], name: "index_organization_addresses_on_organization_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "organizations", ["user_id"], name: "index_organizations_on_user_id", using: :btree

  create_table "others", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pickups", force: :cascade do |t|
    t.datetime "estimated"
    t.datetime "actual"
    t.decimal  "latitude",           precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",          precision: 15, scale: 10, default: 0.0
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.integer  "donation_id"
    t.string   "street_address"
    t.string   "street_address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "pickupstatus_id"
    t.string   "country_code",                                 default: "+1"
  end

  add_index "pickups", ["donation_id"], name: "index_pickups_on_donation_id", using: :btree
  add_index "pickups", ["pickupstatus_id"], name: "index_pickups_on_pickupstatus_id", using: :btree

  create_table "pickupstatuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "street_address_two"
    t.string   "city"
    t.integer  "phone"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "state"
    t.string   "zip"
    t.string   "country_code",                                 default: "US"
    t.decimal  "latitude",           precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",          precision: 15, scale: 10, default: 0.0
  end

  create_table "roles", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "seed_migration_data_migrations", force: :cascade do |t|
    t.string   "version"
    t.integer  "runtime"
    t.datetime "migrated_on"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean  "notifications"
    t.boolean  "active"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.integer  "distance",      default: 20
  end

  add_index "settings", ["user_id"], name: "index_settings_on_user_id", using: :btree

  create_table "types", force: :cascade do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "donation_id"
    t.integer  "donation_type_id"
  end

  add_index "types", ["donation_id"], name: "index_types_on_donation_id", using: :btree
  add_index "types", ["donation_type_id"], name: "index_types_on_donation_type_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "description"
    t.datetime "expiration"
    t.string   "phone"
    t.integer  "role_id"
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
    t.string   "auth_token",             default: ""
    t.string   "avatar"
    t.string   "type"
    t.string   "provider"
    t.string   "uid"
    t.string   "company"
  end

  add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "donation_images", "donations"
  add_foreign_key "donation_items", "donations"
  add_foreign_key "dropoffs", "donations"
  add_foreign_key "dropoffs", "dropoffstatuses"
  add_foreign_key "organization_addresses", "organizations"
  add_foreign_key "organizations", "users"
  add_foreign_key "pickups", "donations"
  add_foreign_key "pickups", "pickupstatuses"
  add_foreign_key "settings", "users"
  add_foreign_key "types", "donation_types"
  add_foreign_key "types", "donations"
end
