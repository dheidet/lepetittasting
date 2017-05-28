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

ActiveRecord::Schema.define(version: 20170526155322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competition_price_stages", force: :cascade do |t|
    t.float    "wine_price"
    t.float    "transport_price"
    t.integer  "conditionning"
    t.integer  "competition_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["competition_id"], name: "index_competition_price_stages_on_competition_id", using: :btree
  end

  create_table "competitions", force: :cascade do |t|
    t.integer  "wine_id"
    t.integer  "contenance"
    t.string   "competitor"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wine_id"], name: "index_competitions_on_wine_id", using: :btree
  end

  create_table "estates", force: :cascade do |t|
    t.string   "name"
    t.integer  "mark"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_estates_on_user_id", using: :btree
  end

  create_table "tastings", force: :cascade do |t|
    t.string   "eye_color"
    t.integer  "eye_intensity"
    t.string   "nose_condition"
    t.integer  "nose_intensity"
    t.string   "nose_development"
    t.float    "nose_quality"
    t.integer  "palate_sweetness"
    t.integer  "palate_acidity"
    t.integer  "palate_tanin"
    t.integer  "palate_alcohol"
    t.integer  "palate_body"
    t.integer  "flavour_intensity"
    t.integer  "palate_finish"
    t.float    "palate_quality"
    t.string   "readiness"
    t.float    "balance"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "user_id"
    t.string   "photo"
    t.integer  "wine_id"
    t.index ["user_id"], name: "index_tastings_on_user_id", using: :btree
    t.index ["wine_id"], name: "index_tastings_on_wine_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "wines", force: :cascade do |t|
    t.integer  "estate_id"
    t.string   "name"
    t.string   "label"
    t.date     "vintage"
    t.string   "grape_variety"
    t.string   "color"
    t.integer  "mark"
    t.string   "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "alcohol"
    t.string   "agricultural_mode"
    t.boolean  "available"
    t.integer  "price_cents"
    t.string   "style"
    t.boolean  "sulfites"
    t.integer  "user_id"
    t.string   "photo"
    t.index ["estate_id"], name: "index_wines_on_estate_id", using: :btree
    t.index ["user_id"], name: "index_wines_on_user_id", using: :btree
  end

  add_foreign_key "competition_price_stages", "competitions"
  add_foreign_key "competitions", "wines"
  add_foreign_key "estates", "users"
  add_foreign_key "tastings", "users"
  add_foreign_key "tastings", "wines"
  add_foreign_key "wines", "users"
end
