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

ActiveRecord::Schema[7.0].define(version: 2024_03_25_154048) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colleges_exams", id: false, force: :cascade do |t|
    t.bigint "college_id"
    t.bigint "exam_id"
    t.index ["college_id"], name: "index_colleges_exams_on_college_id"
    t.index ["exam_id"], name: "index_colleges_exams_on_exam_id"
  end

  create_table "exam_exam_windows", id: false, force: :cascade do |t|
    t.bigint "exam_id"
    t.bigint "exam_window_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_exam_windows_on_exam_id"
    t.index ["exam_window_id"], name: "index_exam_exam_windows_on_exam_window_id"
  end

  create_table "exam_windows", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exam_windows_exams", id: false, force: :cascade do |t|
    t.bigint "exam_id"
    t.bigint "exam_window_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_windows_exams_on_exam_id"
    t.index ["exam_window_id"], name: "index_exam_windows_exams_on_exam_window_id"
  end

  create_table "exams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exam_window_id"
    t.index ["exam_window_id"], name: "index_exams_on_exam_window_id"
  end

  create_table "exams_users", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exams_users_on_exam_id"
    t.index ["user_id"], name: "index_exams_users_on_user_id"
  end

  create_table "user_exams", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "exams_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exams_id"], name: "index_user_exams_on_exams_id"
    t.index ["user_id"], name: "index_user_exams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_no"
    t.bigint "college_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_users_on_college_id"
  end

  add_foreign_key "users", "colleges"
end
