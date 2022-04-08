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

ActiveRecord::Schema.define(version: 2022_03_31_010826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dancers", force: :cascade do |t|
    t.string "japanese_notation", null: false
    t.string "universal_notation", null: false
    t.string "russian_notation"
    t.string "name_order", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "variations", "variation_programs"
end
