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

ActiveRecord::Schema.define(version: 20130618023356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_logs", force: true do |t|
    t.string   "food_name"
    t.decimal  "carbs",       precision: 5, scale: 2
    t.decimal  "fat",         precision: 5, scale: 2
    t.decimal  "protein",     precision: 5, scale: 2
    t.datetime "consumed_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", force: true do |t|
    t.string   "food_name"
    t.decimal  "carbs",      precision: 5, scale: 2
    t.decimal  "fat",        precision: 5, scale: 2
    t.decimal  "protein",    precision: 5, scale: 2
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "amount"
    t.decimal  "servings",   precision: 5, scale: 2
  end

  create_table "recipes", force: true do |t|
    t.string   "recipe_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "servings",    precision: 5, scale: 2
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.decimal  "start_weight",             precision: 5, scale: 2
    t.decimal  "goal_weight",              precision: 5, scale: 2
    t.decimal  "current_weight",           precision: 5, scale: 2
    t.integer  "height"
    t.string   "sex",            limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "water_logs", force: true do |t|
    t.decimal  "volume",      precision: 5, scale: 2
    t.datetime "consumed_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weight_logs", force: true do |t|
    t.decimal  "weight",      precision: 5, scale: 2
    t.datetime "measured_at"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
