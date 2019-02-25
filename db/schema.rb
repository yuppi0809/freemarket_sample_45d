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

ActiveRecord::Schema.define(version: 20190225070209) do

  create_table "category_larges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "category_middles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_large_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["category_large_id"], name: "index_category_middles_on_category_large_id", using: :btree
  end

  create_table "category_smalls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",               null: false
    t.integer  "category_middle_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["category_middle_id"], name: "index_category_smalls_on_category_middle_id", using: :btree
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
    t.integer  "local",                            null: false
    t.integer  "lead_time",                        null: false
    t.string   "brand"
    t.integer  "category_large_id"
    t.integer  "category_middle_id"
    t.integer  "category_small_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["category_large_id"], name: "index_products_on_category_large_id", using: :btree
    t.index ["category_middle_id"], name: "index_products_on_category_middle_id", using: :btree
    t.index ["category_small_id"], name: "index_products_on_category_small_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
  end

  add_foreign_key "category_middles", "category_larges"
  add_foreign_key "category_smalls", "category_middles"
  add_foreign_key "products", "category_larges"
  add_foreign_key "products", "category_middles"
  add_foreign_key "products", "category_smalls"
end
