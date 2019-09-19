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

ActiveRecord::Schema.define(version: 2019_09_19_051553) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.string "answer"
    t.boolean "correct"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "telephone"
    t.string "address"
    t.string "logo_url"
    t.string "website_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contents", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.integer "difficulty"
    t.integer "order"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_contents_on_lesson_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "min_score"
    t.integer "time_limit"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_exams_on_lesson_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.bigint "training_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_id"], name: "index_lessons_on_training_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "question"
    t.bigint "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_questions_on_exam_id"
  end

  create_table "slide_images", force: :cascade do |t|
    t.string "img_url"
    t.bigint "slide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_id"], name: "index_slide_images_on_slide_id"
  end

  create_table "slide_links", force: :cascade do |t|
    t.string "link_url"
    t.bigint "slide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_id"], name: "index_slide_links_on_slide_id"
  end

  create_table "slide_text_fragments", force: :cascade do |t|
    t.string "text"
    t.integer "order"
    t.bigint "slide_text_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_text_id"], name: "index_slide_text_fragments_on_slide_text_id"
  end

  create_table "slide_texts", force: :cascade do |t|
    t.string "title"
    t.bigint "slide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_id"], name: "index_slide_texts_on_slide_id"
  end

  create_table "slide_videos", force: :cascade do |t|
    t.string "video_url"
    t.bigint "slide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slide_id"], name: "index_slide_videos_on_slide_id"
  end

  create_table "slides", force: :cascade do |t|
    t.string "img_url"
    t.bigint "slideshow_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slideshow_id"], name: "index_slides_on_slideshow_id"
  end

  create_table "slideshows", force: :cascade do |t|
    t.string "name"
    t.string "bucket_url"
    t.string "info_link"
    t.bigint "content_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id"], name: "index_slideshows_on_content_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_trainings_on_company_id"
  end

  create_table "user_exams", force: :cascade do |t|
    t.integer "score"
    t.integer "attempts"
    t.integer "time"
    t.bigint "exam_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_user_exams_on_exam_id"
    t.index ["user_id"], name: "index_user_exams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "questions"
  add_foreign_key "contents", "lessons"
  add_foreign_key "exams", "lessons"
  add_foreign_key "lessons", "trainings"
  add_foreign_key "questions", "exams"
  add_foreign_key "slide_images", "slides"
  add_foreign_key "slide_links", "slides"
  add_foreign_key "slide_text_fragments", "slide_texts"
  add_foreign_key "slide_texts", "slides"
  add_foreign_key "slide_videos", "slides"
  add_foreign_key "slides", "slideshows"
  add_foreign_key "trainings", "companies"
  add_foreign_key "user_exams", "exams"
  add_foreign_key "user_exams", "users"
  add_foreign_key "users", "companies"
end
