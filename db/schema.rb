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

ActiveRecord::Schema.define(version: 20140404185521) do

  create_table "goals", force: true do |t|
    t.string   "GoalName"
    t.string   "Route"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "distance"
    t.integer  "gtHour"
    t.integer  "gtMin"
    t.integer  "gtSec"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "points", force: true do |t|
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "orderNum"
    t.integer  "route_id"
  end

  add_index "points", ["route_id"], name: "index_points_on_route_id"

  create_table "routes", force: true do |t|
    t.string   "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "run_id"
    t.integer  "numPoints"
  end

  add_index "routes", ["run_id"], name: "index_routes_on_run_id"

  create_table "runs", force: true do |t|
    t.string   "name"
    t.string   "date"
    t.string   "dist"
    t.string   "humidity"
    t.string   "temp"
    t.string   "hr"
    t.string   "min"
    t.string   "sec"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "runs", ["user_id"], name: "index_runs_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

end
