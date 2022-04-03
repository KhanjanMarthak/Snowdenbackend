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

ActiveRecord::Schema[7.0].define(version: 2022_04_02_231323) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "booking_date"
    t.integer "status"
    t.bigint "consumer_id"
    t.bigint "service_provider_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consumer_id"], name: "index_bookings_on_consumer_id"
    t.index ["service_provider_id"], name: "index_bookings_on_service_provider_id"
  end

  create_table "consumers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.text "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "service_providers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "service"
    t.string "password_digest"
    t.text "address"
    t.string "start_time"
    t.decimal "latitude"
    t.decimal "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "end_time"
  end

  add_foreign_key "bookings", "consumers"
  add_foreign_key "bookings", "service_providers"
end
