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

ActiveRecord::Schema.define(version: 20160826011402) do

  create_table "customers", force: :cascade do |t|
    t.string   "business_name"
    t.string   "stripe_id"
    t.string   "uuid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "customers_users", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "customers_users", ["customer_id"], name: "index_customers_users_on_customer_id"
  add_index "customers_users", ["user_id"], name: "index_customers_users_on_user_id"

  create_table "mapped_phones", force: :cascade do |t|
    t.integer  "mapping_id"
    t.integer  "phone_number_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "mapping_types", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "received_text"
    t.string   "reply_text"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "mapping_type_id"
    t.text     "external_function"
    t.text     "hours_url"
    t.text     "location"
    t.text     "call_back_info"
  end

  add_index "mappings", ["customer_id"], name: "index_mappings_on_customer_id"
  add_index "mappings", ["mapping_type_id"], name: "index_mappings_on_mapping_type_id"

  create_table "phone_numbers", force: :cascade do |t|
    t.string   "number"
    t.boolean  "ours"
    t.integer  "customer_id"
    t.text     "our_metadata"
    t.text     "customer_metadata"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "phone_numbers", ["customer_id"], name: "index_phone_numbers_on_customer_id"

  create_table "user_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "user_type_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["user_type_id"], name: "index_users_on_user_type_id"

end
