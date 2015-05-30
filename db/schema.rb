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

ActiveRecord::Schema.define(version: 20150530175906) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "collection_innovations", force: :cascade do |t|
    t.integer  "collection_id"
    t.integer  "innovation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_collections", force: :cascade do |t|
    t.integer "event_id"
    t.integer "collection_id"
  end

  create_table "events", force: :cascade do |t|
    t.integer  "collection_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.string   "title"
    t.string   "street_1"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "postal_code"
    t.string   "longitude"
    t.string   "latitude"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "innovation_tags", force: :cascade do |t|
    t.integer  "innovation_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "innovations", force: :cascade do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "body"
    t.boolean  "consented"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "user_id"
    t.boolean  "hidden",     default: false
  end

  add_index "innovations", ["title"], name: "index_innovations_on_title", using: :btree
  add_index "innovations", ["user_id"], name: "index_innovations_on_user_id", using: :btree

  create_table "live_pages", force: :cascade do |t|
    t.string   "hangout_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "innovation_id"
    t.integer  "user_id"
    t.integer  "novelty_rating",   null: false
    t.integer  "usability_rating", null: false
    t.integer  "value_rating",     null: false
    t.integer  "fourth_rating",    null: false
    t.integer  "fifth_rating",     null: false
    t.text     "content"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "reviews", ["user_id", "innovation_id"], name: "index_reviews_on_user_id_and_innovation_id", unique: true, using: :btree

  create_table "revisions", force: :cascade do |t|
    t.string   "title"
    t.text     "abstract"
    t.text     "body"
    t.boolean  "consented"
    t.integer  "user_id"
    t.integer  "innovation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.boolean  "reviewer",               default: false
    t.boolean  "admin",                  default: false
    t.boolean  "accepted_terms",         default: false
    t.datetime "accepted_terms_time"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "identities", "users"
  add_foreign_key "innovations", "users"
end
