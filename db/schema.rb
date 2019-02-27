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

ActiveRecord::Schema.define(version: 20190227103436) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.string   "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
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
    t.integer  "local",                            null: false
    t.integer  "lead_time",                        null: false
    t.string   "brand"
    t.integer  "category_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
  end

  add_foreign_key "product_images", "products"
  add_foreign_key "products", "categories"
end
