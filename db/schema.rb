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

ActiveRecord::Schema.define(version: 20170327210713081470) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.string   "vin"
    t.string   "car_make"
    t.string   "car_model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "phone_number"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "seems_rateable_rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.string   "rateable_type"
    t.integer  "rateable_id"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["dimension"], name: "index_seems_rateable_rates_on_dimension", using: :btree
    t.index ["rateable_id", "rateable_type"], name: "index_seems_rateable_rates_on_rateable_id_and_rateable_type", using: :btree
    t.index ["rater_id"], name: "index_seems_rateable_rates_on_rater_id", using: :btree
  end

  create_table "trips", force: :cascade do |t|
    t.date     "date"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "driver_id"
    t.integer  "passenger_id"
    t.float    "price"
    t.index ["driver_id"], name: "index_trips_on_driver_id", using: :btree
    t.index ["passenger_id"], name: "index_trips_on_passenger_id", using: :btree
  end

  add_foreign_key "trips", "drivers"
  add_foreign_key "trips", "passengers"
end
