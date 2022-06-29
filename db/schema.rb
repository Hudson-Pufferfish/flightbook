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

ActiveRecord::Schema.define(version: 2022_06_29_040431) do

  create_table "airports", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.string "city", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["code"], name: "index_airports_on_code", unique: true
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "confirmation", null: false
    t.integer "flight_id", null: false
    t.index ["confirmation"], name: "index_bookings_on_confirmation", unique: true
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "duration", null: false
    t.integer "origin_id", null: false
    t.integer "destination_id", null: false
    t.date "date", null: false
    t.time "time", null: false
    t.integer "flight_number", null: false
    t.index ["destination_id"], name: "index_flights_on_destination_id"
    t.index ["origin_id"], name: "index_flights_on_origin_id"
  end

  create_table "passenger_bookings", id: false, force: :cascade do |t|
    t.integer "passenger_id", null: false
    t.integer "booking_id", null: false
    t.index ["booking_id"], name: "index_passenger_bookings_on_booking_id"
    t.index ["passenger_id"], name: "index_passenger_bookings_on_passenger_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", null: false
    t.string "email", null: false
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "airports", column: "destination_id"
  add_foreign_key "flights", "airports", column: "origin_id"
  add_foreign_key "passenger_bookings", "bookings"
  add_foreign_key "passenger_bookings", "passengers"
end
