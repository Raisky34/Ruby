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

ActiveRecord::Schema.define(version: 20180424210613) do

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_airports_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planes", force: :cascade do |t|
    t.string "name"
    t.integer "seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trips", force: :cascade do |t|
    t.decimal "cost"
    t.datetime "time_out"
    t.datetime "time_in"
    t.integer "plane_id"
    t.integer "airport_from_id"
    t.integer "airport_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_from_id"], name: "index_trips_on_airport_from_id"
    t.index ["airport_to_id"], name: "index_trips_on_airport_to_id"
    t.index ["plane_id"], name: "index_trips_on_plane_id"
  end

  create_table "trips_users", id: false, force: :cascade do |t|
    t.integer "trip_id", null: false
    t.integer "user_id", null: false
    t.index ["trip_id", "user_id"], name: "index_trips_users_on_trip_id_and_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
