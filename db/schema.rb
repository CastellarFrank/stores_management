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

ActiveRecord::Schema.define(version: 20140605232751) do

  create_table "contacts", force: true do |t|
    t.string   "title"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "store_id"
  end

  add_index "contacts", ["store_id"], name: "index_contacts_on_store_id"

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "store_id"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "unit_price"
    t.decimal  "wholesale"
    t.decimal  "size"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "products", ["group_id"], name: "index_products_on_group_id"

  create_table "stores", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "manager_name"
    t.integer  "telephone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
