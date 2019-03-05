ActiveRecord::Schema.define(version: 20190302103555) do

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

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "profile",              limit: 65535
    t.integer  "prefecture",                         null: false
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

  add_foreign_key "payments", "users"
  add_foreign_key "profiles", "users"
end
