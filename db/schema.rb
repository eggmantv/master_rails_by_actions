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

ActiveRecord::Schema.define(version: 20170214090948) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "address_type"
    t.string   "contact_name"
    t.string   "cellphone"
    t.string   "address"
    t.string   "zipcode"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id", "address_type"], name: "index_addresses_on_user_id_and_address_type", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.integer  "weight",           default: 0
    t.integer  "products_counter", default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
    t.index ["title"], name: "index_categories_on_title", using: :btree
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "address_id"
    t.string   "order_no"
    t.integer  "amount"
    t.decimal  "total_money", precision: 10, scale: 2
    t.datetime "payment_at"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "payment_id"
    t.string   "status",                               default: "initial"
    t.index ["order_no"], name: "index_orders_on_order_no", unique: true, using: :btree
    t.index ["payment_id"], name: "index_orders_on_payment_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "payment_no"
    t.string   "transaction_no"
    t.string   "status",                                                default: "initial"
    t.decimal  "total_money",                  precision: 10, scale: 2
    t.datetime "payment_at"
    t.text     "raw_response",   limit: 65535
    t.datetime "created_at",                                                                null: false
    t.datetime "updated_at",                                                                null: false
    t.index ["payment_no"], name: "index_payments_on_payment_no", unique: true, using: :btree
    t.index ["transaction_no"], name: "index_payments_on_transaction_no", using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "product_images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "product_id"
    t.integer  "weight",             default: 0
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["product_id", "weight"], name: "index_product_images_on_product_id_and_weight", using: :btree
    t.index ["product_id"], name: "index_product_images_on_product_id", using: :btree
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "status",                                             default: "off"
    t.integer  "amount",                                             default: 0
    t.string   "uuid"
    t.decimal  "msrp",                      precision: 10, scale: 2
    t.decimal  "price",                     precision: 10, scale: 2
    t.text     "description", limit: 65535
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["status", "category_id"], name: "index_products_on_status_and_category_id", using: :btree
    t.index ["title"], name: "index_products_on_title", using: :btree
    t.index ["uuid"], name: "index_products_on_uuid", unique: true, using: :btree
  end

  create_table "shopping_carts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "user_uuid"
    t.integer  "product_id"
    t.integer  "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shopping_carts_on_user_id", using: :btree
    t.index ["user_uuid"], name: "index_shopping_carts_on_user_uuid", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "uuid"
    t.integer  "default_address_id"
    t.string   "cellphone"
    t.index ["activation_token"], name: "index_users_on_activation_token", using: :btree
    t.index ["cellphone"], name: "index_users_on_cellphone", using: :btree
    t.index ["email"], name: "index_users_on_email", using: :btree
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
    t.index ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree
  end

  create_table "verify_tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "token"
    t.string   "cellphone"
    t.datetime "expired_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cellphone", "token"], name: "index_verify_tokens_on_cellphone_and_token", using: :btree
  end

end
