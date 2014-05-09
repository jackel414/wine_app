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

ActiveRecord::Schema.define(version: 20140509122802) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "role",          default: "User"
    t.boolean  "active",        default: true
  end

  create_table "wines", force: true do |t|
    t.string   "name"
    t.string   "grapes"
    t.string   "region"
    t.string   "country"
    t.boolean  "stored"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "add_region"
    t.string   "winery"
    t.string   "vintage"
    t.string   "location"
    t.string   "wine_type"
    t.float    "price"
    t.boolean  "catalog"
    t.string   "purchase_date"
    t.string   "drink_date"
    t.boolean  "with_meal"
    t.string   "meal"
    t.text     "notes"
    t.integer  "rating"
    t.integer  "num_bottles"
    t.float    "abv"
    t.integer  "user_id"
    t.string   "add_region_2"
  end

end
