Autumn's Playdate


ActiveRecord::Schema.define(version: 20170627003810) do

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
    t.string  "name"
    t.string  "email"
    t.integer "phone"
    t.string  "password_digest"
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

