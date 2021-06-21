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

ActiveRecord::Schema.define(version: 2021_06_16_102611) do

  create_table "actionitems", force: :cascade do |t|
    t.text "body"
    t.boolean "ischeck", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sprint_id"
    t.index ["sprint_id"], name: "index_actionitems_on_sprint_id"
  end

  create_table "improvements", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes", default: 0
    t.integer "sprint_id"
    t.index ["sprint_id"], name: "index_improvements_on_sprint_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "what_went_wells", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes", default: 0
    t.integer "sprint_id"
    t.index ["sprint_id"], name: "index_what_went_wells_on_sprint_id"
  end

  create_table "what_went_wrongs", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "likes", default: 0
    t.integer "sprint_id"
    t.index ["sprint_id"], name: "index_what_went_wrongs_on_sprint_id"
  end

end
