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

ActiveRecord::Schema.define(version: 20180509135604) do

  create_table "buyers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "pseudo"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "avatar"
    t.index ["email"], name: "index_buyers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_buyers_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "price"
    t.date "date"
    t.string "duration"
    t.string "description"
    t.string "file"
    t.string "quantity"
    t.bigint "seller_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["category_id"], name: "index_offers_on_category_id"
    t.index ["seller_id"], name: "index_offers_on_seller_id"
  end

  create_table "preferences", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "buyer_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_preferences_on_buyer_id"
    t.index ["category_id"], name: "index_preferences_on_category_id"
  end

  create_table "reservations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "offer_id"
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.integer "number_of_persons"
    t.time "time"
    t.index ["buyer_id"], name: "index_reservations_on_buyer_id"
    t.index ["offer_id"], name: "index_reservations_on_offer_id"
    t.index ["seller_id"], name: "index_reservations_on_seller_id"
  end

  create_table "sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "address"
    t.string "zip_code"
    t.string "city"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "avatar"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_sellers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true
  end

  add_foreign_key "offers", "categories"
  add_foreign_key "offers", "sellers"
  add_foreign_key "preferences", "buyers"
  add_foreign_key "preferences", "categories"
  add_foreign_key "reservations", "buyers"
  add_foreign_key "reservations", "offers"
  add_foreign_key "reservations", "sellers"
end
