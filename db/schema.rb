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

ActiveRecord::Schema.define(version: 20150716181934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "children", force: :cascade do |t|
    t.string   "name",          null: false
    t.string   "age"
    t.string   "allergies"
    t.string   "fav_food"
    t.string   "interests"
    t.string   "bed_time"
    t.string   "potty_trained"
    t.string   "special_needs"
    t.integer  "family_id",     null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "families", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "phone_number", null: false
    t.string   "address",      null: false
    t.string   "picture"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "family_nannies", force: :cascade do |t|
    t.integer  "family_id",  null: false
    t.integer  "nanny_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "family_nannies", ["family_id", "nanny_id"], name: "index_family_nannies_on_family_id_and_nanny_id", unique: true, using: :btree
  add_index "family_nannies", ["family_id"], name: "index_family_nannies_on_family_id", using: :btree
  add_index "family_nannies", ["nanny_id"], name: "index_family_nannies_on_nanny_id", using: :btree

  create_table "nannies", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
