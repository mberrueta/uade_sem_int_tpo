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

ActiveRecord::Schema.define(version: 2018_09_22_000000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "academic_calendars", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id"
    t.integer "year"
    t.string "calendar_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_academic_calendars_on_organization_id"
  end

  create_table "attendances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "student_id"
    t.uuid "course_id"
    t.date "date"
    t.string "present_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_attendances_on_course_id"
    t.index ["student_id"], name: "index_attendances_on_student_id"
  end

  create_table "courses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "academic_calendar_id"
    t.uuid "manager_id"
    t.integer "max_students"
    t.string "name"
    t.string "classroom"
    t.string "shift"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_calendar_id"], name: "index_courses_on_academic_calendar_id"
    t.index ["manager_id"], name: "index_courses_on_manager_id"
  end

  create_table "exam_questions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "exam_id"
    t.string "question"
    t.json "options", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_exam_questions_on_exam_id"
  end

  create_table "exams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.uuid "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_exams_on_subject_id"
  end

  create_table "news", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "organization_id"
    t.string "title"
    t.string "description"
    t.boolean "sent"
    t.uuid "newsable_id"
    t.string "newsable_type"
    t.string "present_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["newsable_type", "newsable_id"], name: "index_news_on_newsable_type_and_newsable_id"
    t.index ["organization_id"], name: "index_news_on_organization_id"
  end

  create_table "organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.string "web_page"
    t.string "logo"
    t.string "organization_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "address"
    t.string "email"
    t.string "gender"
    t.string "picture_url"
    t.string "type", null: false
    t.string "student_ids", default: [], array: true
    t.uuid "course_id"
    t.uuid "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_people_on_organization_id"
  end

  create_table "programs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "subject_id"
    t.date "date"
    t.boolean "done", default: false
    t.integer "class_number"
    t.string "title"
    t.string "description"
    t.string "picture_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id"], name: "index_programs_on_subject_id"
  end

  create_table "qualification_report_subjects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "subject_id"
    t.uuid "qualification_report_id"
    t.integer "results", array: true
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qualification_report_id"], name: "index_qualification_report_subjects_on_qualification_report_id"
    t.index ["subject_id"], name: "index_qualification_report_subjects_on_subject_id"
  end

  create_table "qualification_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "student_id"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_qualification_reports_on_student_id"
  end

  create_table "student_answers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "student_exam_id"
    t.string "answer_code"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_exam_id"], name: "index_student_answers_on_student_exam_id"
  end

  create_table "student_exam_qualifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "student_exam_id"
    t.float "result"
    t.float "score"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_exam_id"], name: "index_student_exam_qualifications_on_student_exam_id"
  end

  create_table "student_exams", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "exam_id"
    t.uuid "student_id"
    t.integer "questions_to_show"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_student_exams_on_exam_id"
    t.index ["student_id"], name: "index_student_exams_on_student_id"
  end

  create_table "subjects", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "course_id"
    t.string "name"
    t.string "code"
    t.string "day"
    t.string "hour"
    t.uuid "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_subjects_on_course_id"
    t.index ["teacher_id"], name: "index_subjects_on_teacher_id"
  end

  create_table "topics", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "program_id"
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_topics_on_program_id"
  end

  add_foreign_key "academic_calendars", "organizations"
  add_foreign_key "attendances", "courses"
  add_foreign_key "attendances", "people", column: "student_id"
  add_foreign_key "courses", "academic_calendars"
  add_foreign_key "courses", "people", column: "manager_id"
  add_foreign_key "exam_questions", "exams"
  add_foreign_key "exams", "subjects"
  add_foreign_key "news", "organizations"
  add_foreign_key "people", "courses"
  add_foreign_key "people", "organizations"
  add_foreign_key "programs", "subjects"
  add_foreign_key "qualification_report_subjects", "qualification_reports"
  add_foreign_key "qualification_report_subjects", "subjects"
  add_foreign_key "qualification_reports", "people", column: "student_id"
  add_foreign_key "student_answers", "student_exams"
  add_foreign_key "student_exam_qualifications", "student_exams"
  add_foreign_key "student_exams", "exams"
  add_foreign_key "student_exams", "people", column: "student_id"
  add_foreign_key "subjects", "courses"
  add_foreign_key "subjects", "people", column: "teacher_id"
  add_foreign_key "topics", "programs"
end
