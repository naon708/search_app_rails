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

ActiveRecord::Schema.define(version: 2022_05_01_131514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dancers", force: :cascade do |t|
    t.string "japanese_notation"
    t.string "universal_notation", null: false
    t.string "russian_notation"
    t.string "name_order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
  end

  create_table "mark_dancers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dancer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dancer_id"], name: "index_mark_dancers_on_dancer_id"
    t.index ["user_id", "dancer_id"], name: "index_mark_dancers_on_user_id_and_dancer_id", unique: true
    t.index ["user_id"], name: "index_mark_dancers_on_user_id"
  end

  create_table "mark_programs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "program_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["program_id"], name: "index_mark_programs_on_program_id"
    t.index ["user_id", "program_id"], name: "index_mark_programs_on_user_id_and_program_id", unique: true
    t.index ["user_id"], name: "index_mark_programs_on_user_id"
  end

  create_table "mark_steps", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "step_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["step_id"], name: "index_mark_steps_on_step_id"
    t.index ["user_id", "step_id"], name: "index_mark_steps_on_user_id_and_step_id", unique: true
    t.index ["user_id"], name: "index_mark_steps_on_user_id"
  end

  create_table "mark_variations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "variation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "variation_id"], name: "index_mark_variations_on_user_id_and_variation_id", unique: true
    t.index ["user_id"], name: "index_mark_variations_on_user_id"
    t.index ["variation_id"], name: "index_mark_variations_on_variation_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "japanese_notation", null: false
    t.string "universal_notation", null: false
    t.string "russian_notation"
    t.string "name_order", null: false
    t.string "wikipedia_path"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "search_results", force: :cascade do |t|
    t.string "search_word", null: false
    t.string "video_id", null: false
    t.string "title", null: false
    t.string "description"
    t.string "thumbnail", null: false
    t.integer "view_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "steps", force: :cascade do |t|
    t.string "japanese_notation", null: false
    t.string "universal_notation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "variation_programs", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "variations", force: :cascade do |t|
    t.bigint "variation_program_id", null: false
    t.string "title", null: false
    t.string "japanese_notation", null: false
    t.string "universal_notation", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["variation_program_id"], name: "index_variations_on_variation_program_id"
  end

  add_foreign_key "mark_dancers", "dancers"
  add_foreign_key "mark_dancers", "users"
  add_foreign_key "mark_programs", "programs"
  add_foreign_key "mark_programs", "users"
  add_foreign_key "mark_steps", "steps"
  add_foreign_key "mark_steps", "users"
  add_foreign_key "mark_variations", "users"
  add_foreign_key "mark_variations", "variations"
  add_foreign_key "variations", "variation_programs"
end
