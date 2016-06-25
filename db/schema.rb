# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160625050456) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "album_stats", force: :cascade do |t|
    t.string   "album"
    t.integer  "views"
    t.integer  "likes"
    t.string   "caption"
    t.string   "tags"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order"
  end

  create_table "albums", force: :cascade do |t|
    t.string   "user"
    t.string   "password"
    t.string   "album_name"
    t.boolean  "secured"
    t.datetime "created_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "authentications", force: :cascade do |t|
    t.string   "album"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
