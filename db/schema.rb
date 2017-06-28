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

ActiveRecord::Schema.define(version: 20170628004708) do

  create_table "checkins", force: :cascade do |t|
    t.integer "child_id"
    t.integer "location_id"
    t.integer "parent_id"
  end

  create_table "children", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.string  "gender"
  end

  create_table "comments", force: :cascade do |t|
    t.string  "comment"
    t.integer "parent_id"
    t.integer "playdate_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

  create_table "parents", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
    t.integer "playdate_id"
  end

  create_table "playdates", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "description"
    t.datetime "datetime"
    t.integer  "originator"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
  end

end
