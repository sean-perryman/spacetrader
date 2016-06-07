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

ActiveRecord::Schema.define(version: 20160607170731) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string   "Name"
    t.integer  "Base_Price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planet_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "planet_id"
    t.integer  "price_mod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "planet_items", ["item_id"], name: "index_planet_items_on_item_id", using: :btree
  add_index "planet_items", ["planet_id"], name: "index_planet_items_on_planet_id", using: :btree

  create_table "planets", force: :cascade do |t|
    t.string   "Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_ships", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "ship_id"
    t.integer  "cargo_mod"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "player_ships", ["player_id"], name: "index_player_ships_on_player_id", using: :btree
  add_index "player_ships", ["ship_id"], name: "index_player_ships_on_ship_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.string   "Name"
    t.integer  "Credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ship_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "ship_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ship_items", ["item_id"], name: "index_ship_items_on_item_id", using: :btree
  add_index "ship_items", ["ship_id"], name: "index_ship_items_on_ship_id", using: :btree

  create_table "ships", force: :cascade do |t|
    t.string   "Name"
    t.integer  "Base_Cargo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
