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

ActiveRecord::Schema.define(version: 2019_10_21_200105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.boolean "adult"
    t.bigint "budget"
    t.string "genres"
    t.string "homepage"
    t.string "imdb_id"
    t.string "original_language"
    t.string "original_title"
    t.text "overview"
    t.string "popularity"
    t.date "release_date"
    t.bigint "revenue"
    t.bigint "runtime"
    t.string "status"
    t.string "tagline"
    t.string "title"
    t.boolean "video"
    t.string "vote_average"
    t.bigint "vote_count"
    t.string "url"
  end

  create_table "tokens", force: :cascade do |t|
    t.string "token_salt"
    t.string "token_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_salt"
    t.string "password_hash"
  end

end
