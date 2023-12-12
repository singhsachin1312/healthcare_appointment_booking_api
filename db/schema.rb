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

ActiveRecord::Schema[7.0].define(version: 2023_12_12_073557) do
  create_table "appointments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "appointment_start_time"
    t.datetime "appointment_end_time"
    t.integer "status"
    t.bigint "healthcare_professional_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "professional_availability_id"
    t.index ["healthcare_professional_id"], name: "index_appointments_on_healthcare_professional_id"
    t.index ["professional_availability_id"], name: "index_appointments_on_professional_availability_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "healthcare_professionals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "specialization"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "professional_availabilities", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "day"
    t.time "available_from"
    t.time "available_to"
    t.bigint "healthcare_professional_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["healthcare_professional_id"], name: "index_professional_availabilities_on_healthcare_professional_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
