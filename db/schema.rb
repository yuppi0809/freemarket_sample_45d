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

ActiveRecord::Schema.define(version: 20190317034415) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",    null: false
    t.integer  "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_likes_on_product_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "card_num",         null: false
    t.integer  "expiration_month", null: false
    t.integer  "expiration_year",  null: false
    t.integer  "security_code",    null: false
    t.integer  "user_id",          null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["card_num"], name: "index_payments_on_card_num", unique: true, using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image",      limit: 65535, null: false
    t.integer  "product_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                             null: false
    t.text     "description",        limit: 65535, null: false
    t.integer  "price",                            null: false
    t.integer  "likes_count"
    t.integer  "size"
    t.integer  "product_status",                   null: false
    t.integer  "transaction_status",               null: false
    t.integer  "delivery_fee",                     null: false
    t.integer  "lead_time",                        null: false
    t.string   "brand"
    t.integer  "user_id"
    t.integer  "first_category_id"
    t.integer  "second_category_id"
    t.integer  "third_category_id"
    t.integer  "brand_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "prefecture_id",                    null: false
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["user_id"], name: "index_products_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "profile",              limit: 65535
    t.string   "city",                               null: false
    t.string   "address",                            null: false
    t.string   "postal_code",                        null: false
    t.string   "building_name"
    t.string   "telephone_num"
    t.string   "delv_first_name",                    null: false
    t.string   "delv_last_name",                     null: false
    t.string   "delv_first_name_kana",               null: false
    t.string   "delv_last_name_kana",                null: false
    t.integer  "user_id",                            null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "prefecture_id",                      null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "first_name_kana",                     null: false
    t.string   "last_name_kana",                      null: false
    t.integer  "birth_year",                          null: false
    t.integer  "birth_month",                         null: false
    t.integer  "birth_day",                           null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "verify_sms",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["verify_sms"], name: "index_users_on_verify_sms", unique: true, using: :btree
  end

  add_foreign_key "likes", "products"
  add_foreign_key "likes", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "products", "users"
  add_foreign_key "profiles", "users"
end
