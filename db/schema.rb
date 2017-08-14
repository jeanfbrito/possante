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

ActiveRecord::Schema.define(version: 20170813235245) do

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "maintenances", force: :cascade do |t|
    t.datetime "date"
    t.decimal  "cost"
    t.text     "description"
    t.datetime "warranty"
    t.integer  "mileage"
    t.integer  "vehicle_id"
    t.string   "warranty_status"
    t.string   "type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_id"], name: "index_maintenances_on_vehicle_id"
  end

  create_table "refuellings", force: :cascade do |t|
    t.datetime "date"
    t.integer  "mileage"
    t.decimal  "liter_price"
    t.float    "liters"
    t.string   "gas_station"
    t.integer  "traveled_mileage"
    t.decimal  "total_value"
    t.integer  "result"
    t.string   "vehicle_id"
    t.float    "average_consumption"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "brand"
    t.string   "model"
    t.string   "fabrication"
    t.integer  "mileage"
    t.string   "status"
    t.string   "numberplate"
    t.string   "slug"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
