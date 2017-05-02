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

ActiveRecord::Schema.define(version: 20170430232343) do

  create_table "children", force: :cascade do |t|
    t.string  "name"
    t.integer "age"
    t.integer "playdates_id"
    t.string  "gender"
  end

  create_table "parents", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.integer "phone"
    t.integer "playdate_id"
    t.string  "password_digest"
  end

  create_table "playdates", force: :cascade do |t|
    t.string  "name"
    t.string  "location"
    t.integer "parents_id"
    t.integer "children_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "child_id"
  end

end
