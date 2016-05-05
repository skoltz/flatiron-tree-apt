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

ActiveRecord::Schema.define(version: 20151009181201) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "greenthumbs", force: :cascade do |t|
    t.text    "garden_name"
    t.text    "address"
    t.text    "boro"
    t.decimal "size",        precision: 3, scale: 3
    t.float   "longitude"
    t.float   "latitude"
  end

  create_table "latitudes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "longitudes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parks", force: :cascade do |t|
    t.text     "address"
    t.string   "park"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "running_tracks", force: :cascade do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "address"
    t.text     "location"
    t.float    "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wifis", force: :cascade do |t|
    t.string   "boro"
    t.string   "wifi_type"
    t.string   "provider"
    t.text     "name"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location_t"
    t.string   "city"
    t.string   "ssid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
