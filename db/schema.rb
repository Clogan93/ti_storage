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

ActiveRecord::Schema.define(version: 20161113032009) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.text    "comment"
    t.string  "written_by"
    t.string  "written_via"
    t.date    "published_at"
    t.integer "rating"
    t.integer "storage_id"
    t.index ["storage_id"], name: "index_reviews_on_storage_id", using: :btree
  end

  create_table "storages", force: :cascade do |t|
    t.string "category"
    t.string "title"
    t.string "slug"
    t.string "area_slug"
    t.string "phone"
    t.string "address"
    t.string "area"
    t.string "zip_code"
    t.string "coordinates"
    t.text   "office_hours"
    t.text   "access_hours"
    t.text   "description_1"
    t.text   "description_2"
    t.text   "directions"
    t.text   "features"
    t.string "link_to_google"
    t.string "link_to_yelp"
  end

end
