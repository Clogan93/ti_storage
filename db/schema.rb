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

ActiveRecord::Schema.define(version: 20170115090904) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "citext"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "account_id"
    t.integer  "contact_id"
  end

  create_table "addresses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "address_id"
    t.integer  "contact_id"
    t.jsonb    "data"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "site_id"
    t.integer  "unit_id"
    t.integer  "account_id"
    t.integer  "contact_id"
    t.jsonb    "data"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.boolean  "is_customer"
    t.jsonb    "data"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "reservation_id"
    t.integer  "transaction_id"
    t.jsonb    "data"
  end

  create_table "phones", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "phone_id"
    t.integer  "contact_id"
    t.jsonb    "data"
  end

  create_table "reservations", force: :cascade do |t|
    t.string   "type"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "move_in_date"
    t.string   "phone"
    t.string   "email"
    t.string   "card_name"
    t.string   "card_number"
    t.date     "card_expiry_date"
    t.string   "coupon_code"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "unit_id"
    t.integer  "site_id"
    t.integer  "account_id"
    t.integer  "version"
    t.decimal  "price",            precision: 7, scale: 2
    t.integer  "quote_id"
    t.integer  "rental_id"
  end

  create_table "storage_units", force: :cascade do |t|
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.integer  "site_id"
    t.integer  "unit_id"
    t.jsonb    "data"
    t.integer  "version"
    t.decimal  "rent_rate",                       precision: 7, scale: 2
    t.decimal  "push_rate",                       precision: 7, scale: 2
    t.integer  "width"
    t.integer  "depth"
    t.integer  "height"
    t.decimal  "square_feet",                     precision: 7, scale: 2
    t.integer  "total_units_in_available_status"
  end

  create_table "storages", force: :cascade do |t|
    t.integer "category_id"
    t.string  "title"
    t.string  "slug"
    t.string  "phone"
    t.string  "address"
    t.string  "area"
    t.string  "zip_code"
    t.string  "coordinates"
    t.string  "place_id"
    t.text    "office_hours"
    t.text    "access_hours"
    t.text    "description_1"
    t.text    "description_2"
    t.text    "directions"
    t.text    "features"
    t.string  "link_to_google_maps"
    t.string  "link_to_yelp"
    t.string  "link_to_google_reviews"
    t.integer "site_id"
    t.jsonb   "data"
    t.index ["category_id"], name: "index_storages_on_category_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "email"
  end

end
