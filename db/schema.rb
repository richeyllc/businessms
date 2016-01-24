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

ActiveRecord::Schema.define(version: 20160124001349) do

  create_table "customers", force: :cascade do |t|
    t.string   "business_name"
    t.string   "stripe_id"
    t.string   "uuid"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "mappings", force: :cascade do |t|
    t.integer  "customer_id"
    t.integer  "phone_number_id"
    t.integer  "incoming_phone_number_id"
    t.string   "received_text"
    t.string   "reply_text"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "mappings", ["customer_id"], name: "index_mappings_on_customer_id"
  add_index "mappings", ["incoming_phone_number_id"], name: "index_mappings_on_incoming_phone_number_id"
  add_index "mappings", ["phone_number_id"], name: "index_mappings_on_phone_number_id"

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

end
