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

ActiveRecord::Schema[8.0].define(version: 2025_02_03_142416) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "examinees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_examinees_on_email", unique: true
  end

  create_table "tests", force: :cascade do |t|
    t.string "test_name"
    t.string "organization_name"
    t.jsonb "sections", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "full_marks"
    t.string "duration"
    t.string "ongoing_status"
    t.string "start_date"
    t.string "end_date"
    t.string "start_time"
    t.string "end_time"
    t.string "description"
  end
end
