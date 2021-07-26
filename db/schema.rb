# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_26_122958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "number_plate"
    t.string "vehicle_color"
    t.string "brand"
    t.string "phone"
  end

  create_table "riders", force: :cascade do |t|
    t.string "name"
    t.string "phone"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "rider_id", null: false
    t.bigint "driver_id", null: false
    t.datetime "initial_time"
    t.datetime "finish_time"
    t.decimal "initial_latitude"
    t.decimal "initial_longitude"
    t.decimal "finish_latitude"
    t.decimal "finish_longitude"
    t.decimal "fare"
    t.boolean "fee_paid", default: false
    t.index ["driver_id"], name: "index_trips_on_driver_id"
    t.index ["rider_id"], name: "index_trips_on_rider_id"
  end

  add_foreign_key "trips", "drivers"
  add_foreign_key "trips", "riders"
end
