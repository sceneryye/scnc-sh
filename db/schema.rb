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

ActiveRecord::Schema.define(version: 20160426053851) do

  create_table "brands", primary_key: "brand_id", force: :cascade do |t|
    t.string  "brand_name",     limit: 50,                            null: false
    t.string  "brand_url",      limit: 255
    t.string  "brand_slogan",   limit: 255
    t.string  "brand_logo",     limit: 255
    t.text    "brand_keywords", limit: 4294967295
    t.text    "brand_setting",  limit: 4294967295
    t.string  "disabled",       limit: 5,          default: "false"
    t.integer "ordernum",       limit: 3
    t.string  "slug",           limit: 255
    t.string  "status",         limit: 255,        default: "normal"
    t.boolean "reco",                              default: false
    t.text    "detail_desc",    limit: 65535
    t.text    "context",        limit: 65535
  end

  add_index "brands", ["disabled"], name: "ind_disabled", using: :btree
  add_index "brands", ["ordernum"], name: "ind_ordernum", using: :btree
  add_index "brands", ["slug"], name: "index_sdb_b2c_brand_on_slug", unique: true, using: :btree

  create_table "card_logs", force: :cascade do |t|
    t.integer  "card_id",    limit: 4
    t.string   "card_no",    limit: 255
    t.integer  "member_id",  limit: 4
    t.string   "message",    limit: 5000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "card_trading_logs", force: :cascade do |t|
    t.integer  "rebate_id",    limit: 4
    t.string   "card_no",      limit: 45
    t.integer  "status",       limit: 1,                           default: 0
    t.decimal  "amount",                  precision: 10, scale: 2
    t.datetime "trading_time"
    t.string   "order_id",     limit: 45
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "no",                 limit: 255
    t.integer  "value",              limit: 4
    t.string   "card_type",          limit: 255
    t.boolean  "sale_status"
    t.boolean  "use_status"
    t.string   "status",             limit: 255
    t.string   "password",           limit: 255
    t.boolean  "pay_status",                     default: false
    t.datetime "sold_at"
    t.datetime "used_at"
    t.integer  "try_password_times", limit: 4,   default: 0
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "cart_objects", id: false, force: :cascade do |t|
    t.string  "obj_ident",    limit: 255,                     null: false
    t.string  "member_ident", limit: 50,                      null: false
    t.integer "member_id",    limit: 4,          default: -1, null: false
    t.string  "obj_type",     limit: 20,                      null: false
    t.text    "params",       limit: 4294967295,              null: false
    t.float   "quantity",     limit: 24,                      null: false
    t.integer "time",         limit: 4
    t.integer "supplier_id",  limit: 4
    t.integer "status",       limit: 4,          default: 0
    t.integer "coupon_id",    limit: 4
  end

  add_index "cart_objects", ["member_id"], name: "ind_member_id", using: :btree

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "goods", primary_key: "goods_id", force: :cascade do |t|
    t.string  "bn",               limit: 200,                                                    null: false
    t.string  "name",             limit: 200,                                 default: "",       null: false
    t.decimal "price",                               precision: 20, scale: 3, default: 0.0,      null: false
    t.integer "type_id",          limit: 3
    t.integer "cat_id",           limit: 3,                                   default: 0,        null: false
    t.integer "brand_id",         limit: 3
    t.string  "marketable",       limit: 5,                                   default: "true",   null: false
    t.decimal "store",                               precision: 20, scale: 2
    t.integer "notify_num",       limit: 3,                                   default: 0,        null: false
    t.integer "uptime",           limit: 4
    t.integer "downtime",         limit: 4
    t.integer "last_modify",      limit: 4
    t.integer "p_order",          limit: 3,                                   default: 30,       null: false
    t.integer "d_order",          limit: 3,                                   default: 30,       null: false
    t.integer "score",            limit: 3
    t.decimal "cost",                                precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "mktprice",                            precision: 20, scale: 3
    t.decimal "weight",                              precision: 20, scale: 3
    t.string  "unit",             limit: 20
    t.string  "brief",            limit: 255
    t.string  "goods_type",       limit: 6,                                   default: "normal", null: false
    t.string  "image_default_id", limit: 32
    t.string  "images_url",       limit: 32
    t.string  "udfimg",           limit: 5,                                   default: "false"
    t.string  "thumbnail_pic",    limit: 32
    t.string  "small_pic",        limit: 255
    t.string  "medium_pic",       limit: 255
    t.string  "big_pic",          limit: 255
    t.text    "intro",            limit: 4294967295
    t.text    "designer",         limit: 4294967295
    t.string  "store_place",      limit: 255
    t.integer "min_buy",          limit: 3
    t.decimal "package_scale",                       precision: 20, scale: 2
    t.string  "package_unit",     limit: 20
    t.string  "package_use",      limit: 1
    t.string  "score_setting",    limit: 7,                                   default: "number"
    t.string  "nostore_sell",     limit: 1,                                   default: "0"
    t.text    "goods_setting",    limit: 4294967295
    t.text    "spec_desc",        limit: 4294967295
    t.text    "params",           limit: 4294967295
    t.string  "disabled",         limit: 5,                                   default: "false",  null: false
    t.integer "rank_count",       limit: 4,                                   default: 0,        null: false
    t.integer "comments_count",   limit: 4,                                   default: 0,        null: false
    t.integer "view_w_count",     limit: 4,                                   default: 0,        null: false
    t.integer "view_count",       limit: 4,                                   default: 0,        null: false
    t.text    "count_stat",       limit: 4294967295
    t.integer "buy_count",        limit: 4,                                   default: 0,        null: false
    t.integer "buy_w_count",      limit: 4,                                   default: 0,        null: false
    t.text    "material",         limit: 65535
    t.text    "mesure",           limit: 65535
    t.text    "try_on",           limit: 65535
    t.integer "softness",         limit: 4
    t.integer "thickness",        limit: 4
    t.integer "elasticity",       limit: 4
    t.integer "fitness",          limit: 4
    t.string  "sbn",              limit: 255
    t.text    "desc",             limit: 65535
    t.integer "supplier_id",      limit: 4
    t.string  "place",            limit: 255
    t.decimal "bulk",                                precision: 20, scale: 3
    t.decimal "wholesale",                           precision: 20, scale: 3
    t.decimal "promotion",                           precision: 20, scale: 3
    t.text    "place_info",       limit: 65535
    t.text    "spec_info",        limit: 65535
    t.string  "future",           limit: 5,                                   default: "false"
    t.string  "sell",             limit: 5,                                   default: "false"
    t.string  "agent",            limit: 5,                                   default: "false"
    t.decimal "share",                               precision: 5,  scale: 2, default: 0.01
    t.integer "member_id",        limit: 4
    t.integer "freight",          limit: 4,                                   default: 10
  end

  add_index "goods", ["brand_id"], name: "idx_c_brand_id", using: :btree
  add_index "goods", ["cat_id"], name: "idx_c_cat_id", using: :btree
  add_index "goods", ["disabled", "goods_type", "marketable"], name: "ind_frontend", using: :btree
  add_index "goods", ["type_id"], name: "idx_c_type_id", using: :btree

  create_table "goods_cat", primary_key: "cat_id", force: :cascade do |t|
    t.integer "parent_id",       limit: 3
    t.string  "cat_path",        limit: 100,        default: ","
    t.string  "is_leaf",         limit: 5,          default: "false", null: false
    t.integer "type_id",         limit: 3
    t.string  "cat_name",        limit: 100,        default: "",      null: false
    t.text    "gallery_setting", limit: 4294967295
    t.string  "disabled",        limit: 5,          default: "false", null: false
    t.integer "p_order",         limit: 3,          default: 0
    t.integer "goods_count",     limit: 3
    t.text    "tabs",            limit: 4294967295
    t.text    "finder",          limit: 4294967295
    t.text    "addon",           limit: 4294967295
    t.integer "child_count",     limit: 3,          default: 0,       null: false
    t.string  "future",          limit: 5,          default: "false"
    t.string  "sell",            limit: 5,          default: "false"
    t.string  "agent",           limit: 5,          default: "false"
  end

  add_index "goods_cat", ["cat_path"], name: "ind_cat_path", using: :btree
  add_index "goods_cat", ["disabled"], name: "ind_disabled", using: :btree

  create_table "member_addrs", primary_key: "addr_id", force: :cascade do |t|
    t.integer "member_id", limit: 3,   default: 0,     null: false
    t.string  "name",      limit: 50
    t.string  "lastname",  limit: 50
    t.string  "firstname", limit: 50
    t.string  "area",      limit: 255
    t.string  "addr",      limit: 255
    t.string  "zip",       limit: 20
    t.string  "tel",       limit: 50
    t.string  "mobile",    limit: 50
    t.boolean "def_addr",              default: false
    t.integer "addr_type", limit: 4
    t.string  "email",     limit: 45
  end

  add_index "member_addrs", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "member_advance", primary_key: "log_id", force: :cascade do |t|
    t.integer "member_id",      limit: 3,                            default: 0,       null: false
    t.decimal "money",                      precision: 20, scale: 3, default: 0.0,     null: false
    t.string  "message",        limit: 255
    t.integer "mtime",          limit: 4,                            default: 0,       null: false
    t.string  "payment_id",     limit: 20
    t.integer "order_id",       limit: 8
    t.string  "paymethod",      limit: 100
    t.string  "memo",           limit: 100
    t.decimal "import_money",               precision: 20, scale: 3, default: 0.0,     null: false
    t.decimal "explode_money",              precision: 20, scale: 3, default: 0.0,     null: false
    t.decimal "member_advance",             precision: 20, scale: 3, default: 0.0,     null: false
    t.decimal "shop_advance",               precision: 20, scale: 3, default: 0.0,     null: false
    t.string  "disabled",       limit: 5,                            default: "false", null: false
  end

  add_index "member_advance", ["disabled"], name: "ind_disabled", using: :btree
  add_index "member_advance", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "member_advance", ["mtime"], name: "ind_mtime", using: :btree
  add_index "member_advance", ["order_id"], name: "idx_c_order_id", using: :btree

  create_table "member_cards", force: :cascade do |t|
    t.integer  "member_id",    limit: 4
    t.integer  "card_id",      limit: 4
    t.string   "bank_name",    limit: 255
    t.string   "bank_branch",  limit: 255
    t.string   "bank_card_no", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "member_type",  limit: 255
    t.string   "buyer_tel",    limit: 255
    t.string   "user_tel",     limit: 255
    t.integer  "buyer_id",     limit: 4
    t.integer  "user_id",      limit: 4
  end

  create_table "members", primary_key: "member_id", force: :cascade do |t|
    t.integer  "member_lv_id",           limit: 3,                                   default: 0,       null: false
    t.string   "card_num",               limit: 45
    t.string   "card_validate",          limit: 5,                                   default: "false"
    t.string   "name",                   limit: 50
    t.integer  "point",                  limit: 4,                                   default: 0,       null: false
    t.decimal  "advance",                                   precision: 20, scale: 3, default: 0.0,     null: false
    t.string   "lastname",               limit: 50
    t.string   "firstname",              limit: 50
    t.string   "area",                   limit: 255
    t.string   "addr",                   limit: 255
    t.string   "mobile",                 limit: 50
    t.string   "tel",                    limit: 50
    t.string   "email",                  limit: 200,                                                   null: false
    t.string   "id_card_number",         limit: 45
    t.integer  "apply_type",             limit: 4,                                   default: 1
    t.datetime "apply_time"
    t.string   "recommend_num",          limit: 45
    t.string   "qq",                     limit: 45
    t.string   "zip",                    limit: 20
    t.integer  "order_num",              limit: 3,                                   default: 0
    t.string   "refer_id",               limit: 50
    t.string   "refer_url",              limit: 200
    t.integer  "b_year",                 limit: 2
    t.integer  "b_month",                limit: 1
    t.integer  "b_day",                  limit: 1
    t.boolean  "state",                                                              default: false,   null: false
    t.string   "sex",                    limit: 1,                                   default: "2",     null: false
    t.text     "addon",                  limit: 4294967295
    t.string   "wedlock",                limit: 1,                                   default: "0",     null: false
    t.string   "education",              limit: 30
    t.string   "vocation",               limit: 50
    t.text     "interest",               limit: 4294967295
    t.decimal  "advance_freeze",                            precision: 20, scale: 3, default: 0.0,     null: false
    t.integer  "point_freeze",           limit: 3,                                   default: 0,       null: false
    t.integer  "point_history",          limit: 3,                                   default: 0,       null: false
    t.decimal  "score_rate",                                precision: 5,  scale: 3
    t.string   "reg_ip",                 limit: 16
    t.integer  "regtime",                limit: 4
    t.integer  "pay_time",               limit: 3
    t.decimal  "biz_money",                                 precision: 20, scale: 3, default: 0.0,     null: false
    t.text     "fav_tags",               limit: 4294967295
    t.text     "custom",                 limit: 4294967295
    t.string   "cur",                    limit: 20
    t.string   "lang",                   limit: 20
    t.integer  "unreadmsg",              limit: 2,                                   default: 0,       null: false
    t.string   "disabled",               limit: 5,                                   default: "false"
    t.text     "remark",                 limit: 65535
    t.string   "remark_type",            limit: 2,                                   default: "b1",    null: false
    t.integer  "login_count",            limit: 4,                                   default: 0,       null: false
    t.integer  "experience",             limit: 4,                                   default: 0
    t.string   "email_validate",         limit: 5,                                   default: "false", null: false
    t.string   "sms_validate",           limit: 5,                                   default: "false", null: false
    t.string   "email_code",             limit: 255
    t.string   "sms_code",               limit: 255
    t.string   "foreign_id",             limit: 255
    t.string   "member_refer",           limit: 50,                                  default: "local"
    t.string   "source",                 limit: 6,                                   default: "pc"
    t.text     "custom_values",          limit: 65535
    t.datetime "sent_sms_at"
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.integer  "belong_to_sale",         limit: 3
    t.string   "bank_info",              limit: 255
  end

  add_index "members", ["disabled"], name: "ind_disabled", using: :btree
  add_index "members", ["email"], name: "ind_email", using: :btree
  add_index "members", ["member_lv_id"], name: "idx_c_member_lv_id", using: :btree
  add_index "members", ["regtime"], name: "ind_regtime", using: :btree

  create_table "order_items", primary_key: "item_id", force: :cascade do |t|
    t.integer "order_id",   limit: 8,                                   default: 0,         null: false
    t.integer "obj_id",     limit: 3,                                   default: 0,         null: false
    t.integer "product_id", limit: 3,                                   default: 0,         null: false
    t.integer "goods_id",   limit: 8,                                   default: 0,         null: false
    t.integer "type_id",    limit: 3
    t.string  "bn",         limit: 40
    t.string  "name",       limit: 200
    t.decimal "cost",                          precision: 20, scale: 3
    t.decimal "price",                         precision: 20, scale: 3, default: 0.0,       null: false
    t.decimal "g_price",                       precision: 20, scale: 3, default: 0.0,       null: false
    t.decimal "amount",                        precision: 20, scale: 3
    t.integer "score",      limit: 3
    t.integer "weight",     limit: 3
    t.float   "nums",       limit: 24,                                  default: 1.0,       null: false
    t.float   "sendnum",    limit: 24,                                  default: 0.0,       null: false
    t.text    "addon",      limit: 4294967295
    t.string  "item_type",  limit: 7,                                   default: "product", null: false
    t.binary  "storaged",   limit: 1
  end

  add_index "order_items", ["bn"], name: "ind_item_bn", using: :btree
  add_index "order_items", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "order_items", ["obj_id"], name: "idx_c_obj_id", using: :btree
  add_index "order_items", ["order_id"], name: "idx_c_order_id", using: :btree
  add_index "order_items", ["product_id"], name: "idx_c_product_id", using: :btree

  create_table "order_log", primary_key: "log_id", force: :cascade do |t|
    t.integer "rel_id",    limit: 8,          default: 0,          null: false
    t.integer "op_id",     limit: 3
    t.string  "op_name",   limit: 100
    t.integer "alttime",   limit: 4
    t.string  "bill_type", limit: 16,         default: "order",    null: false
    t.string  "behavior",  limit: 8,          default: "payments", null: false
    t.string  "result",    limit: 7,                               null: false
    t.text    "log_text",  limit: 4294967295
    t.text    "addon",     limit: 4294967295
  end

  create_table "orders", primary_key: "order_id", force: :cascade do |t|
    t.decimal "total_amount",                       precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "final_amount",                       precision: 20, scale: 3, default: 0.0,      null: false
    t.string  "pay_status",      limit: 1,                                   default: "0",      null: false
    t.string  "ship_status",     limit: 1,                                   default: "0",      null: false
    t.string  "is_delivery",     limit: 1,                                   default: "Y",      null: false
    t.integer "createtime",      limit: 4
    t.integer "last_modified",   limit: 4
    t.string  "payment",         limit: 100
    t.integer "shipping_id",     limit: 3
    t.string  "shipping",        limit: 100
    t.integer "member_id",       limit: 3
    t.string  "status",          limit: 6,                                   default: "active", null: false
    t.string  "confirm",         limit: 1,                                   default: "N",      null: false
    t.string  "ship_area",       limit: 255
    t.string  "ship_name",       limit: 50
    t.decimal "weight",                             precision: 20, scale: 3
    t.text    "tostr",           limit: 4294967295
    t.integer "itemnum",         limit: 3
    t.string  "ip",              limit: 15
    t.text    "ship_addr",       limit: 65535
    t.string  "ship_zip",        limit: 20
    t.string  "ship_tel",        limit: 50
    t.string  "ship_email",      limit: 200
    t.string  "ship_time",       limit: 50
    t.string  "ship_mobile",     limit: 50
    t.decimal "cost_item",                          precision: 20, scale: 3, default: 0.0,      null: false
    t.string  "is_tax",          limit: 5,                                   default: "false",  null: false
    t.decimal "cost_tax",                           precision: 20, scale: 3, default: 0.0,      null: false
    t.string  "tax_company",     limit: 255
    t.string  "is_protect",      limit: 5,                                   default: "false",  null: false
    t.decimal "cost_protect",                       precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "cost_payment",                       precision: 20, scale: 3
    t.string  "currency",        limit: 8
    t.decimal "cur_rate",                           precision: 10, scale: 4, default: 1.0
    t.decimal "score_u",                            precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "score_g",                            precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "discount",                           precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "pmt_goods",                          precision: 20, scale: 3
    t.decimal "pmt_order",                          precision: 20, scale: 3
    t.decimal "payed",                              precision: 20, scale: 3, default: 0.0
    t.integer "installment",     limit: 4
    t.text    "memo",            limit: 4294967295
    t.string  "disabled",        limit: 5,                                   default: "false"
    t.string  "mark_type",       limit: 2,                                   default: "b1",     null: false
    t.text    "mark_text",       limit: 4294967295
    t.text    "delivery_text",   limit: 4294967295
    t.text    "delivery_type",   limit: 4294967295
    t.decimal "cost_freight",                       precision: 20, scale: 3, default: 0.0,      null: false
    t.string  "extend",          limit: 255,                                 default: "false"
    t.string  "order_refer",     limit: 20,                                  default: "local",  null: false
    t.text    "addon",           limit: 4294967295
    t.string  "source",          limit: 6,                                   default: "pc"
    t.decimal "part_pay",                           precision: 10, scale: 3, default: 0.0
    t.integer "desktop_user_id", limit: 4
    t.string  "recommend_user",  limit: 45
    t.integer "supplier_id",     limit: 4
    t.decimal "commission",                         precision: 20, scale: 3
    t.string  "discount_code",   limit: 10
  end

  add_index "orders", ["createtime"], name: "ind_createtime", using: :btree
  add_index "orders", ["disabled"], name: "ind_disabled", using: :btree
  add_index "orders", ["last_modified"], name: "ind_last_modified", using: :btree
  add_index "orders", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "orders", ["pay_status"], name: "ind_pay_status", using: :btree
  add_index "orders", ["ship_status"], name: "ind_ship_status", using: :btree
  add_index "orders", ["shipping_id"], name: "idx_c_shipping_id", using: :btree
  add_index "orders", ["status"], name: "ind_status", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "body",        limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "type",        limit: 255
    t.string   "slug",        limit: 255
    t.string   "layout",      limit: 255
    t.string   "category",    limit: 255
    t.integer  "supplier_id", limit: 4
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "manager_id", limit: 4
    t.text     "rights",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "products", primary_key: "product_id", force: :cascade do |t|
    t.integer "goods_id",    limit: 8,                                   default: 0,        null: false
    t.string  "barcode",     limit: 128
    t.string  "title",       limit: 255
    t.string  "bn",          limit: 30
    t.decimal "price",                          precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "cost",                           precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "mktprice",                       precision: 20, scale: 3
    t.string  "name",        limit: 200,                                 default: "",       null: false
    t.decimal "weight",                         precision: 20, scale: 3
    t.string  "unit",        limit: 20
    t.decimal "store",                          precision: 20, scale: 2
    t.string  "store_place", limit: 255
    t.integer "freez",       limit: 3
    t.string  "goods_type",  limit: 6,                                   default: "normal", null: false
    t.text    "spec_info",   limit: 4294967295
    t.text    "spec_desc",   limit: 4294967295
    t.integer "uptime",      limit: 4
    t.integer "last_modify", limit: 4
    t.string  "disabled",    limit: 5,                                   default: "false"
    t.string  "marketable",  limit: 5,                                   default: "true",   null: false
    t.string  "store_time",  limit: 100
    t.decimal "wholesale",                      precision: 20, scale: 3
    t.decimal "bulk",                           precision: 20, scale: 3
    t.decimal "promotion",                      precision: 20, scale: 3
  end

  add_index "products", ["barcode"], name: "ind_barcode", using: :btree
  add_index "products", ["bn"], name: "ind_bn", unique: true, using: :btree
  add_index "products", ["disabled"], name: "ind_disabled", using: :btree
  add_index "products", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "products", ["goods_id"], name: "ind_goods_id", using: :btree

  create_table "rebates", force: :cascade do |t|
    t.string   "status",      limit: 45
    t.integer  "member_id",   limit: 4
    t.string   "trading_ids", limit: 1000
    t.decimal  "amount",                   precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "resources", force: :cascade do |t|
    t.integer "parent_id",   limit: 4
    t.string  "name",        limit: 255
    t.string  "description", limit: 255
  end

  create_table "sdb_aftersales_return_product", primary_key: "return_id", force: :cascade do |t|
    t.integer "order_id",     limit: 8,          default: 0,       null: false
    t.integer "member_id",    limit: 3,          default: 0,       null: false
    t.string  "return_bn",    limit: 32
    t.string  "title",        limit: 200,                          null: false
    t.text    "content",      limit: 4294967295
    t.string  "status",       limit: 1,          default: "1",     null: false
    t.string  "image_file",   limit: 255
    t.text    "product_data", limit: 4294967295
    t.text    "comment",      limit: 4294967295
    t.integer "add_time",     limit: 4
    t.string  "disabled",     limit: 5,          default: "false", null: false
  end

  add_index "sdb_aftersales_return_product", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "sdb_aftersales_return_product", ["order_id"], name: "idx_c_order_id", using: :btree

  create_table "sdb_b2c_comment_goods_point", primary_key: "point_id", force: :cascade do |t|
    t.decimal "goods_point",                    precision: 2, scale: 1
    t.integer "comment_id",  limit: 3
    t.integer "type_id",     limit: 3,                                  default: 1,       null: false
    t.integer "member_id",   limit: 3,                                  default: 0
    t.integer "goods_id",    limit: 8,                                  default: 0,       null: false
    t.text    "addon",       limit: 4294967295
    t.string  "disabled",    limit: 5,                                  default: "false"
  end

  add_index "sdb_b2c_comment_goods_point", ["comment_id"], name: "idx_c_comment_id", using: :btree
  add_index "sdb_b2c_comment_goods_point", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "sdb_b2c_comment_goods_point", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "sdb_b2c_comment_goods_point", ["type_id"], name: "idx_c_type_id", using: :btree

  create_table "sdb_b2c_comment_goods_type", primary_key: "type_id", force: :cascade do |t|
    t.string "name",  limit: 100,        null: false
    t.text   "addon", limit: 4294967295
  end

  create_table "sdb_b2c_counter", primary_key: "counter_id", force: :cascade do |t|
    t.string "counter_type", limit: 50, null: false
    t.string "counter_name", limit: 30
  end

  add_index "sdb_b2c_counter", ["counter_type", "counter_name"], name: "uni_value", using: :btree

  create_table "sdb_b2c_counter_attach", id: false, force: :cascade do |t|
    t.integer "counter_value", limit: 4, default: 0
    t.integer "attach_id",     limit: 3, default: 0, null: false
    t.integer "counter_id",    limit: 3,             null: false
  end

  add_index "sdb_b2c_counter_attach", ["counter_value"], name: "uni_value", using: :btree

  create_table "sdb_b2c_coupons", primary_key: "cpns_id", force: :cascade do |t|
    t.string  "cpns_name",         limit: 255
    t.integer "pmt_id",            limit: 3
    t.string  "cpns_prefix",       limit: 50,  default: "",  null: false
    t.integer "cpns_gen_quantity", limit: 3,   default: 0,   null: false
    t.string  "cpns_key",          limit: 20,  default: "",  null: false
    t.string  "cpns_status",       limit: 1,   default: "1", null: false
    t.string  "cpns_type",         limit: 1,   default: "0", null: false
    t.integer "cpns_point",        limit: 3
    t.integer "rule_id",           limit: 4
  end

  add_index "sdb_b2c_coupons", ["cpns_prefix"], name: "ind_cpns_prefix", using: :btree
  add_index "sdb_b2c_coupons", ["rule_id"], name: "idx_c_rule_id", using: :btree

  create_table "sdb_b2c_custom_values", force: :cascade do |t|
    t.integer  "order_id",     limit: 8
    t.integer  "member_id",    limit: 4
    t.integer  "product_id",   limit: 4
    t.integer  "spec_item_id", limit: 4
    t.string   "name",         limit: 255
    t.string   "value",        limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "ident",        limit: 255
  end

  create_table "sdb_b2c_delivery", primary_key: "delivery_id", force: :cascade do |t|
    t.string  "order_id",    limit: 100
    t.string  "delivery_bn", limit: 32
    t.integer "member_id",   limit: 3
    t.decimal "money",                          precision: 20, scale: 3, default: 0.0,     null: false
    t.string  "is_protect",  limit: 5,                                   default: "false", null: false
    t.integer "delivery",    limit: 3
    t.string  "logi_id",     limit: 50
    t.string  "logi_name",   limit: 100
    t.string  "logi_no",     limit: 50
    t.string  "ship_name",   limit: 50
    t.string  "ship_area",   limit: 255
    t.text    "ship_addr",   limit: 65535
    t.string  "ship_zip",    limit: 20
    t.string  "ship_tel",    limit: 50
    t.string  "ship_mobile", limit: 50
    t.string  "ship_email",  limit: 200
    t.integer "t_begin",     limit: 4
    t.integer "t_send",      limit: 4
    t.integer "t_confirm",   limit: 4
    t.string  "op_name",     limit: 50
    t.string  "status",      limit: 8,                                   default: "ready", null: false
    t.text    "memo",        limit: 4294967295
    t.string  "disabled",    limit: 5,                                   default: "false"
  end

  add_index "sdb_b2c_delivery", ["delivery"], name: "idx_c_delivery", using: :btree
  add_index "sdb_b2c_delivery", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_b2c_delivery", ["logi_no"], name: "ind_logi_no", using: :btree
  add_index "sdb_b2c_delivery", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "sdb_b2c_delivery_items", primary_key: "item_id", force: :cascade do |t|
    t.integer "delivery_id",   limit: 8,   default: 0,       null: false
    t.integer "order_item_id", limit: 3,   default: 0
    t.string  "item_type",     limit: 7,   default: "goods", null: false
    t.integer "product_id",    limit: 8,   default: 0,       null: false
    t.string  "product_bn",    limit: 30
    t.string  "product_name",  limit: 200
    t.float   "number",        limit: 24,  default: 0.0,     null: false
  end

  add_index "sdb_b2c_delivery_items", ["delivery_id"], name: "idx_c_delivery_id", using: :btree
  add_index "sdb_b2c_delivery_items", ["order_item_id"], name: "idx_c_order_item_id", using: :btree

  create_table "sdb_b2c_discount_codes", id: false, force: :cascade do |t|
    t.integer  "id",         limit: 4,                                           null: false
    t.string   "code",       limit: 6,                                           null: false
    t.string   "status",     limit: 5,                         default: "false"
    t.integer  "member_id",  limit: 4
    t.decimal  "rate_buy",             precision: 5, scale: 2, default: 0.66
    t.decimal  "rate_share",           precision: 5, scale: 2, default: 0.5
    t.datetime "updated_at"
  end

  add_index "sdb_b2c_discount_codes", ["code"], name: "code_UNIQUE", unique: true, using: :btree
  add_index "sdb_b2c_discount_codes", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "sdb_b2c_dly_h_area", primary_key: "dha_id", force: :cascade do |t|
    t.integer "dt_id",          limit: 3
    t.integer "area_id",        limit: 3,          default: 0
    t.string  "price",          limit: 100,        default: "0"
    t.boolean "has_cod",                           default: false, null: false
    t.text    "areaname_group", limit: 4294967295
    t.text    "areaid_group",   limit: 4294967295
    t.string  "config",         limit: 255
    t.string  "expressions",    limit: 255
    t.integer "ordernum",       limit: 2
  end

  create_table "sdb_b2c_dlycorp", primary_key: "corp_id", force: :cascade do |t|
    t.string  "type",        limit: 6
    t.string  "corp_code",   limit: 200
    t.string  "name",        limit: 200
    t.string  "disabled",    limit: 5,   default: "false"
    t.integer "ordernum",    limit: 2
    t.string  "website",     limit: 200
    t.string  "request_url", limit: 200
  end

  add_index "sdb_b2c_dlycorp", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_b2c_dlycorp", ["ordernum"], name: "ind_ordernum", using: :btree
  add_index "sdb_b2c_dlycorp", ["type"], name: "ind_type", using: :btree

  create_table "sdb_b2c_dlytype", primary_key: "dt_id", force: :cascade do |t|
    t.string  "dt_name",        limit: 50
    t.string  "has_cod",        limit: 5,          default: "false", null: false
    t.integer "firstunit",      limit: 3,          default: 0,       null: false
    t.integer "continueunit",   limit: 3,          default: 0,       null: false
    t.string  "is_threshold",   limit: 1,          default: "0"
    t.text    "threshold",      limit: 4294967295
    t.string  "protect",        limit: 5,          default: "false", null: false
    t.float   "protect_rate",   limit: 24
    t.float   "minprice",       limit: 24,         default: 0.0,     null: false
    t.string  "setting",        limit: 1,          default: "1"
    t.string  "def_area_fee",   limit: 5,          default: "false"
    t.float   "firstprice",     limit: 24,         default: 0.0
    t.float   "continueprice",  limit: 24,         default: 0.0
    t.float   "dt_discount",    limit: 24,         default: 0.0
    t.text    "dt_expressions", limit: 4294967295
    t.string  "dt_useexp",      limit: 5,          default: "false"
    t.integer "corp_id",        limit: 3
    t.string  "dt_status",      limit: 1,          default: "1"
    t.text    "detail",         limit: 4294967295
    t.text    "area_fee_conf",  limit: 4294967295
    t.integer "ordernum",       limit: 2,          default: 0
    t.string  "disabled",       limit: 5,          default: "false"
  end

  add_index "sdb_b2c_dlytype", ["disabled"], name: "ind_disabled", using: :btree

  create_table "sdb_b2c_goods_collocations", force: :cascade do |t|
    t.integer  "goods_id",         limit: 4
    t.text     "collocations",     limit: 65535
    t.string   "collocation_type", limit: 255,   default: "goods"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "sdb_b2c_goods_collocations", ["goods_id"], name: "index_sdb_b2c_goods_collocations_on_goods_id", unique: true, using: :btree

  create_table "sdb_b2c_goods_countries", primary_key: "country_id", force: :cascade do |t|
    t.string  "country_name", limit: 50
    t.integer "order",        limit: 4
  end

  create_table "sdb_b2c_goods_keywords", id: false, force: :cascade do |t|
    t.integer "goods_id", limit: 8,   default: 0,       null: false
    t.string  "keyword",  limit: 40,  default: "",      null: false
    t.string  "refer",    limit: 255, default: ""
    t.string  "res_type", limit: 7,   default: "goods", null: false
  end

  create_table "sdb_b2c_goods_lv_price", id: false, force: :cascade do |t|
    t.integer "goods_id",   limit: 8,                          default: 0,   null: false
    t.integer "product_id", limit: 3,                          default: 0,   null: false
    t.integer "level_id",   limit: 3,                          default: 0,   null: false
    t.decimal "price",                precision: 20, scale: 3, default: 0.0, null: false
  end

  create_table "sdb_b2c_goods_promotion_ref", primary_key: "ref_id", force: :cascade do |t|
    t.integer "goods_id",              limit: 8,     default: 0,       null: false
    t.integer "rule_id",               limit: 4,     default: 0,       null: false
    t.text    "description",           limit: 65535
    t.string  "member_lv_ids",         limit: 255,   default: ""
    t.integer "from_time",             limit: 4,     default: 0
    t.integer "to_time",               limit: 4,     default: 0
    t.string  "status",                limit: 5,     default: "false", null: false
    t.string  "stop_rules_processing", limit: 5,     default: "false", null: false
    t.integer "sort_order",            limit: 4,     default: 0,       null: false
    t.text    "action_solution",       limit: 65535,                   null: false
    t.boolean "free_shipping",                       default: false
  end

  add_index "sdb_b2c_goods_promotion_ref", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "sdb_b2c_goods_promotion_ref", ["rule_id"], name: "idx_c_rule_id", using: :btree

  create_table "sdb_b2c_goods_rate", id: false, force: :cascade do |t|
    t.integer "goods_1", limit: 3, default: 0, null: false
    t.integer "goods_2", limit: 3, default: 0, null: false
    t.string  "manual",  limit: 4
    t.integer "rate",    limit: 3, default: 1, null: false
  end

  create_table "sdb_b2c_goods_spec_index", id: false, force: :cascade do |t|
    t.integer "type_id",       limit: 3, default: 0, null: false
    t.integer "spec_id",       limit: 3, default: 0, null: false
    t.integer "spec_value_id", limit: 3, default: 0, null: false
    t.integer "goods_id",      limit: 8, default: 0, null: false
    t.integer "product_id",    limit: 3, default: 0, null: false
  end

  add_index "sdb_b2c_goods_spec_index", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "sdb_b2c_goods_spec_index", ["spec_id"], name: "idx_c_spec_id", using: :btree
  add_index "sdb_b2c_goods_spec_index", ["type_id"], name: "idx_c_type_id", using: :btree

  create_table "sdb_b2c_goods_spec_items", force: :cascade do |t|
    t.integer "goods_id",      limit: 4
    t.integer "spec_item_id",  limit: 4
    t.integer "spec_value_id", limit: 4
    t.string  "fixed_value",   limit: 255
    t.string  "max_value",     limit: 255
    t.string  "min_value",     limit: 255
  end

  create_table "sdb_b2c_goods_type", primary_key: "type_id", force: :cascade do |t|
    t.string  "name",        limit: 100,        default: "",       null: false
    t.string  "floatstore",  limit: 1,          default: "0",      null: false
    t.text    "alias",       limit: 4294967295
    t.string  "is_physical", limit: 1,          default: "1",      null: false
    t.string  "schema_id",   limit: 30,         default: "custom", null: false
    t.text    "setting",     limit: 4294967295
    t.text    "minfo",       limit: 4294967295
    t.text    "params",      limit: 4294967295
    t.text    "sizetable",   limit: 4294967295
    t.string  "dly_func",    limit: 1,          default: "0",      null: false
    t.string  "ret_func",    limit: 1,          default: "0",      null: false
    t.string  "reship",      limit: 8,          default: "normal", null: false
    t.string  "disabled",    limit: 5,          default: "false"
    t.string  "is_def",      limit: 5,          default: "false",  null: false
    t.integer "lastmodify",  limit: 4
  end

  add_index "sdb_b2c_goods_type", ["disabled"], name: "ind_disabled", using: :btree

  create_table "sdb_b2c_goods_type_props", primary_key: "props_id", force: :cascade do |t|
    t.integer "type_id",    limit: 3,                             null: false
    t.string  "type",       limit: 20,                            null: false
    t.string  "search",     limit: 20,         default: "select", null: false
    t.string  "show",       limit: 10,         default: "",       null: false
    t.string  "name",       limit: 100,        default: "",       null: false
    t.text    "alias",      limit: 4294967295
    t.integer "goods_p",    limit: 2
    t.integer "ordernum",   limit: 4,          default: 0
    t.integer "lastmodify", limit: 4
  end

  add_index "sdb_b2c_goods_type_props", ["type_id"], name: "idx_c_type_id", using: :btree
  add_index "sdb_b2c_goods_type_props", ["type_id"], name: "ind_type_id", using: :btree

  create_table "sdb_b2c_goods_type_props_value", primary_key: "props_value_id", force: :cascade do |t|
    t.integer "props_id",   limit: 3,                null: false
    t.string  "name",       limit: 100, default: "", null: false
    t.integer "order_by",   limit: 4,   default: 0,  null: false
    t.string  "alias",      limit: 255, default: "", null: false
    t.integer "lastmodify", limit: 4
  end

  add_index "sdb_b2c_goods_type_props_value", ["props_id"], name: "idx_c_props_id", using: :btree
  add_index "sdb_b2c_goods_type_props_value", ["props_id"], name: "ind_props_id", using: :btree

  create_table "sdb_b2c_goods_type_spec", id: false, force: :cascade do |t|
    t.integer "spec_id",    limit: 3, default: 0,      null: false
    t.integer "type_id",    limit: 3, default: 0,      null: false
    t.string  "spec_style", limit: 8, default: "flat", null: false
  end

  create_table "sdb_b2c_goods_virtual_cat", primary_key: "virtual_cat_id", force: :cascade do |t|
    t.string  "virtual_cat_name", limit: 100,        default: "",      null: false
    t.text    "filter",           limit: 4294967295
    t.text    "addon",            limit: 4294967295
    t.integer "type_id",          limit: 4
    t.string  "disabled",         limit: 5,          default: "false", null: false
    t.integer "parent_id",        limit: 3,          default: 0
    t.integer "cat_id",           limit: 4
    t.integer "p_order",          limit: 3
    t.string  "cat_path",         limit: 100,        default: ","
    t.integer "child_count",      limit: 3,          default: 0
    t.string  "url",              limit: 200,        default: "",      null: false
  end

  add_index "sdb_b2c_goods_virtual_cat", ["cat_path"], name: "ind_cat_path", using: :btree
  add_index "sdb_b2c_goods_virtual_cat", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_b2c_goods_virtual_cat", ["p_order"], name: "ind_p_order", using: :btree

  create_table "sdb_b2c_member_comments", primary_key: "comment_id", force: :cascade do |t|
    t.integer "for_comment_id",  limit: 3,          default: 0
    t.integer "type_id",         limit: 8
    t.integer "order_id",        limit: 8
    t.string  "object_type",     limit: 7,          default: "ask",   null: false
    t.integer "author_id",       limit: 3,          default: 0
    t.string  "author",          limit: 100
    t.string  "contact",         limit: 255
    t.string  "mem_read_status", limit: 5,          default: "false"
    t.string  "adm_read_status", limit: 5,          default: "false"
    t.integer "time",            limit: 4
    t.integer "lastreply",       limit: 4
    t.string  "reply_name",      limit: 100
    t.string  "inbox",           limit: 5,          default: "true"
    t.string  "track",           limit: 5,          default: "true"
    t.string  "has_sent",        limit: 5,          default: "true"
    t.integer "to_id",           limit: 3,          default: 0,       null: false
    t.string  "to_uname",        limit: 100
    t.string  "title",           limit: 255
    t.text    "comment",         limit: 4294967295
    t.string  "ip",              limit: 15
    t.string  "display",         limit: 5,          default: "true"
    t.string  "gask_type",       limit: 50,         default: ""
    t.text    "addon",           limit: 4294967295
    t.integer "p_index",         limit: 1
    t.string  "disabled",        limit: 5,          default: "false"
  end

  add_index "sdb_b2c_member_comments", ["order_id"], name: "idx_c_order_id", using: :btree
  add_index "sdb_b2c_member_comments", ["to_id"], name: "idx_c_to_id", using: :btree
  add_index "sdb_b2c_member_comments", ["type_id"], name: "idx_c_type_id", using: :btree

  create_table "sdb_b2c_member_coupon", id: false, force: :cascade do |t|
    t.string  "memc_code",        limit: 255, default: "",      null: false
    t.integer "cpns_id",          limit: 3,   default: 0,       null: false
    t.integer "member_id",        limit: 3,   default: 0,       null: false
    t.string  "memc_gen_orderid", limit: 15
    t.string  "memc_source",      limit: 1,   default: "a",     null: false
    t.string  "memc_enabled",     limit: 5,   default: "true",  null: false
    t.integer "memc_used_times",  limit: 3,   default: 0
    t.integer "memc_gen_time",    limit: 4
    t.string  "disabled",         limit: 5,   default: "false"
    t.string  "memc_isvalid",     limit: 5,   default: "true",  null: false
  end

  add_index "sdb_b2c_member_coupon", ["memc_gen_orderid"], name: "ind_memc_gen_orderid", using: :btree

  create_table "sdb_b2c_member_goods", primary_key: "gnotify_id", force: :cascade do |t|
    t.integer "goods_id",    limit: 8,                            null: false
    t.integer "member_id",   limit: 3
    t.integer "product_id",  limit: 3
    t.string  "email",       limit: 100
    t.string  "cellphone",   limit: 20
    t.string  "status",      limit: 8,                            null: false
    t.integer "send_time",   limit: 4
    t.integer "create_time", limit: 4
    t.string  "disabled",    limit: 5,          default: "false"
    t.text    "remark",      limit: 4294967295
    t.string  "type",        limit: 3
    t.string  "object_type", limit: 100,        default: "goods"
  end

  add_index "sdb_b2c_member_goods", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "sdb_b2c_member_goods", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "sdb_b2c_member_goods", ["product_id"], name: "idx_c_product_id", using: :btree

  create_table "sdb_b2c_member_lv", primary_key: "member_lv_id", force: :cascade do |t|
    t.string  "name",                limit: 100,                            default: "",       null: false
    t.decimal "dis_count",                         precision: 5,  scale: 2, default: 1.0,      null: false
    t.integer "pre_id",              limit: 3
    t.string  "default_lv",          limit: 1,                              default: "0",      null: false
    t.integer "deposit_freeze_time", limit: 4,                              default: 0
    t.integer "deposit",             limit: 4,                              default: 0
    t.integer "more_point",          limit: 4,                              default: 1
    t.string  "lv_type",             limit: 9,                              default: "retail", null: false
    t.integer "point",               limit: 3,                              default: 0,        null: false
    t.string  "disabled",            limit: 5,                              default: "false"
    t.string  "show_other_price",    limit: 5,                              default: "true",   null: false
    t.boolean "order_limit",                                                default: false,    null: false
    t.decimal "order_limit_price",                 precision: 20, scale: 3, default: 0.0,      null: false
    t.text    "lv_remark",           limit: 65535
    t.integer "experience",          limit: 4,                              default: 0,        null: false
    t.integer "expiretime",          limit: 4,                              default: 0,        null: false
  end

  add_index "sdb_b2c_member_lv", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_b2c_member_lv", ["name"], name: "ind_name", unique: true, using: :btree

  create_table "sdb_b2c_member_msg", primary_key: "msg_id", force: :cascade do |t|
    t.integer "for_id",      limit: 4,     default: 0
    t.integer "from_id",     limit: 3,                       null: false
    t.string  "from_uname",  limit: 100
    t.integer "from_type",   limit: 4,     default: 0
    t.integer "to_id",       limit: 3,     default: 0,       null: false
    t.string  "to_uname",    limit: 100
    t.string  "subject",     limit: 100,                     null: false
    t.text    "content",     limit: 65535,                   null: false
    t.integer "order_id",    limit: 8,     default: 0
    t.integer "create_time", limit: 4
    t.integer "to_time",     limit: 4
    t.string  "has_read",    limit: 5,     default: "false"
    t.string  "keep_unread", limit: 5,     default: "false"
    t.string  "has_star",    limit: 5,     default: "false"
    t.string  "has_sent",    limit: 5,     default: "true"
  end

  add_index "sdb_b2c_member_msg", ["from_id", "has_read", "has_sent"], name: "ind_from_id", using: :btree
  add_index "sdb_b2c_member_msg", ["from_id"], name: "idx_c_from_id", using: :btree
  add_index "sdb_b2c_member_msg", ["to_id", "has_read", "has_sent"], name: "ind_to_id", using: :btree
  add_index "sdb_b2c_member_msg", ["to_id"], name: "idx_c_to_id", using: :btree

  create_table "sdb_b2c_member_point", force: :cascade do |t|
    t.integer "member_id",     limit: 3,   default: 0,    null: false
    t.integer "point",         limit: 4,   default: 0,    null: false
    t.integer "change_point",  limit: 4,   default: 0,    null: false
    t.integer "consume_point", limit: 4,   default: 0,    null: false
    t.integer "addtime",       limit: 4,   default: 0,    null: false
    t.integer "expiretime",    limit: 4,   default: 0,    null: false
    t.string  "reason",        limit: 50,  default: "",   null: false
    t.string  "remark",        limit: 100, default: ""
    t.integer "related_id",    limit: 8
    t.boolean "type",                      default: true, null: false
    t.string  "operator",      limit: 50
  end

  add_index "sdb_b2c_member_point", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "sdb_b2c_member_pwdlog", primary_key: "pwdlog_id", force: :cascade do |t|
    t.integer "member_id",  limit: 3,                 null: false
    t.string  "secret",     limit: 100, default: "",  null: false
    t.integer "expiretime", limit: 4
    t.string  "has_used",   limit: 1,   default: "N", null: false
  end

  add_index "sdb_b2c_member_pwdlog", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "sdb_b2c_member_systmpl", primary_key: "tmpl_name", force: :cascade do |t|
    t.text    "content",  limit: 4294967295
    t.integer "edittime", limit: 4,                           null: false
    t.string  "active",   limit: 5,          default: "true"
  end

  create_table "sdb_b2c_order_coupon_user", id: false, force: :cascade do |t|
    t.integer "order_id",  limit: 8,   default: 0, null: false
    t.integer "cpns_id",   limit: 3,   default: 0, null: false
    t.string  "cpns_name", limit: 255
    t.integer "usetime",   limit: 4
    t.string  "memc_code", limit: 255
    t.string  "cpns_type", limit: 1
  end

  create_table "sdb_b2c_order_customs", force: :cascade do |t|
    t.integer  "order_id",   limit: 4
    t.integer  "member_id",  limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "sdb_b2c_order_delivery", id: false, force: :cascade do |t|
    t.integer "order_id", limit: 8,     default: 0,          null: false
    t.string  "dlytype",  limit: 8,     default: "delivery", null: false
    t.string  "dly_id",   limit: 20,                         null: false
    t.text    "items",    limit: 65535
  end

  create_table "sdb_b2c_order_objects", primary_key: "obj_id", force: :cascade do |t|
    t.integer "order_id",  limit: 8,                            default: 0,   null: false
    t.string  "obj_type",  limit: 50,                           default: "",  null: false
    t.string  "obj_alias", limit: 100,                          default: "",  null: false
    t.integer "goods_id",  limit: 8,                            default: 0,   null: false
    t.string  "bn",        limit: 40
    t.string  "name",      limit: 200
    t.decimal "price",                 precision: 20, scale: 3, default: 0.0, null: false
    t.decimal "amount",                precision: 20, scale: 3, default: 0.0, null: false
    t.float   "quantity",  limit: 24,                           default: 1.0, null: false
    t.integer "weight",    limit: 3
    t.integer "score",     limit: 3
  end

  add_index "sdb_b2c_order_objects", ["bn"], name: "ind_obj_bn", using: :btree
  add_index "sdb_b2c_order_objects", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "sdb_b2c_order_objects", ["order_id"], name: "idx_c_order_id", using: :btree

  create_table "sdb_b2c_order_pmt", id: false, force: :cascade do |t|
    t.integer "pmt_id",       limit: 4,                                                     null: false
    t.integer "order_id",     limit: 8,                                                     null: false
    t.string  "pmt_type",     limit: 6,                                   default: "goods", null: false
    t.decimal "pmt_amount",                      precision: 20, scale: 3, default: 0.0,     null: false
    t.text    "pmt_memo",     limit: 4294967295
    t.text    "pmt_describe", limit: 4294967295
  end

  create_table "sdb_b2c_reship", primary_key: "reship_id", force: :cascade do |t|
    t.string  "order_id",    limit: 100
    t.string  "reship_bn",   limit: 32
    t.integer "member_id",   limit: 3
    t.decimal "money",                          precision: 20, scale: 3, default: 0.0,     null: false
    t.string  "is_protect",  limit: 5,                                   default: "false", null: false
    t.string  "delivery",    limit: 20
    t.string  "logi_id",     limit: 50
    t.string  "logi_name",   limit: 100
    t.string  "logi_no",     limit: 50
    t.string  "ship_name",   limit: 50
    t.string  "ship_area",   limit: 255
    t.text    "ship_addr",   limit: 65535
    t.string  "ship_zip",    limit: 20
    t.string  "ship_tel",    limit: 50
    t.string  "ship_mobile", limit: 50
    t.string  "ship_email",  limit: 200
    t.integer "t_begin",     limit: 4
    t.integer "t_send",      limit: 4
    t.integer "t_confirm",   limit: 4
    t.string  "op_name",     limit: 50
    t.string  "status",      limit: 8,                                   default: "ready", null: false
    t.text    "memo",        limit: 4294967295
    t.string  "disabled",    limit: 5,                                   default: "false"
  end

  add_index "sdb_b2c_reship", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_b2c_reship", ["logi_no"], name: "ind_logi_no", using: :btree
  add_index "sdb_b2c_reship", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "sdb_b2c_reship_items", primary_key: "item_id", force: :cascade do |t|
    t.integer "reship_id",     limit: 8,   default: 0,       null: false
    t.integer "order_item_id", limit: 3,   default: 0
    t.string  "item_type",     limit: 7,   default: "goods", null: false
    t.integer "product_id",    limit: 8,   default: 0,       null: false
    t.string  "product_bn",    limit: 30
    t.string  "product_name",  limit: 200
    t.float   "number",        limit: 24,  default: 0.0,     null: false
  end

  add_index "sdb_b2c_reship_items", ["order_item_id"], name: "idx_c_order_item_id", using: :btree
  add_index "sdb_b2c_reship_items", ["reship_id"], name: "idx_c_reship_id", using: :btree

  create_table "sdb_b2c_sales_rule_goods", primary_key: "rule_id", force: :cascade do |t|
    t.string  "name",                  limit: 255,        default: "",      null: false
    t.text    "description",           limit: 65535
    t.integer "create_time",           limit: 4
    t.integer "from_time",             limit: 4,          default: 0
    t.integer "to_time",               limit: 4,          default: 0
    t.string  "member_lv_ids",         limit: 255,        default: ""
    t.string  "status",                limit: 5,          default: "false", null: false
    t.text    "conditions",            limit: 4294967295,                   null: false
    t.string  "stop_rules_processing", limit: 5,          default: "false", null: false
    t.integer "sort_order",            limit: 4,          default: 0,       null: false
    t.text    "action_solution",       limit: 4294967295,                   null: false
    t.boolean "free_shipping",                            default: false
    t.string  "c_template",            limit: 100
    t.string  "s_template",            limit: 100
    t.integer "apply_time",            limit: 4
  end

  create_table "sdb_b2c_sales_rule_order", primary_key: "rule_id", force: :cascade do |t|
    t.string  "name",                  limit: 255,        default: "",      null: false
    t.text    "description",           limit: 65535
    t.integer "from_time",             limit: 4,          default: 0
    t.integer "to_time",               limit: 4,          default: 0
    t.string  "member_lv_ids",         limit: 255,        default: "",      null: false
    t.string  "status",                limit: 5,          default: "false", null: false
    t.text    "conditions",            limit: 4294967295,                   null: false
    t.text    "action_conditions",     limit: 4294967295
    t.string  "stop_rules_processing", limit: 5,          default: "false", null: false
    t.integer "sort_order",            limit: 4,          default: 0,       null: false
    t.text    "action_solution",       limit: 4294967295,                   null: false
    t.string  "free_shipping",         limit: 1,          default: "0"
    t.string  "rule_type",             limit: 1,          default: "N",     null: false
    t.string  "c_template",            limit: 100
    t.string  "s_template",            limit: 255
  end

  create_table "sdb_b2c_sell_logs", primary_key: "log_id", force: :cascade do |t|
    t.integer "member_id",    limit: 3,                            default: 0,   null: false
    t.string  "name",         limit: 50,                           default: ""
    t.decimal "price",                    precision: 20, scale: 3, default: 0.0
    t.integer "product_id",   limit: 3,                            default: 0,   null: false
    t.integer "goods_id",     limit: 8,                            default: 0,   null: false
    t.string  "product_name", limit: 200,                          default: ""
    t.string  "spec_info",    limit: 200,                          default: ""
    t.integer "number",       limit: 3,                            default: 0
    t.integer "createtime",   limit: 4
  end

  add_index "sdb_b2c_sell_logs", ["goods_id"], name: "idx_c_goods_id", using: :btree
  add_index "sdb_b2c_sell_logs", ["member_id", "product_id", "goods_id"], name: "ind_goods_id", using: :btree
  add_index "sdb_b2c_sell_logs", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "sdb_b2c_shop", primary_key: "shop_id", force: :cascade do |t|
    t.string "name",      limit: 255,                    null: false
    t.string "node_id",   limit: 32
    t.string "node_type", limit: 128
    t.string "status",    limit: 6,   default: "unbind"
    t.string "node_apiv", limit: 8
  end

  create_table "sdb_b2c_spec_items", force: :cascade do |t|
    t.string "name",      limit: 255
    t.string "item_type", limit: 255, default: "fixed"
  end

  create_table "sdb_b2c_spec_values", primary_key: "spec_value_id", force: :cascade do |t|
    t.integer "spec_id",    limit: 3,   default: 0,  null: false
    t.string  "spec_value", limit: 100, default: "", null: false
    t.string  "alias",      limit: 255, default: ""
    t.string  "spec_image", limit: 32,  default: ""
    t.integer "p_order",    limit: 3,   default: 50, null: false
  end

  add_index "sdb_b2c_spec_values", ["spec_id"], name: "idx_c_spec_id", using: :btree
  add_index "sdb_b2c_spec_values", ["spec_image"], name: "idx_c_spec_image", using: :btree

  create_table "sdb_b2c_specification", primary_key: "spec_id", force: :cascade do |t|
    t.string  "spec_name",      limit: 50,  default: "",      null: false
    t.string  "spec_show_type", limit: 6,   default: "flat",  null: false
    t.string  "spec_type",      limit: 5,   default: "text",  null: false
    t.string  "spec_memo",      limit: 50,  default: "",      null: false
    t.integer "p_order",        limit: 3,   default: 0,       null: false
    t.string  "disabled",       limit: 5,   default: "false", null: false
    t.string  "alias",          limit: 255, default: ""
  end

  create_table "sdb_b2c_type_brand", id: false, force: :cascade do |t|
    t.integer "type_id",     limit: 3, default: 0, null: false
    t.integer "brand_id",    limit: 3, default: 0, null: false
    t.integer "brand_order", limit: 3
  end

  create_table "sdb_b2c_vshop_apply", force: :cascade do |t|
    t.string   "name",       limit: 45
    t.string   "weixin",     limit: 45
    t.string   "license",    limit: 45
    t.string   "agreement",  limit: 45
    t.integer  "member_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "process",    limit: 45
  end

  create_table "sdb_base_app_content", primary_key: "content_id", force: :cascade do |t|
    t.string  "content_type",  limit: 80,                    null: false
    t.string  "app_id",        limit: 32,                    null: false
    t.string  "content_name",  limit: 80
    t.string  "content_title", limit: 100
    t.string  "content_path",  limit: 255
    t.integer "ordernum",      limit: 2,   default: 50
    t.integer "input_time",    limit: 4
    t.string  "disabled",      limit: 5,   default: "false"
  end

  add_index "sdb_base_app_content", ["app_id"], name: "idx_c_app_id", using: :btree

  create_table "sdb_base_apps", primary_key: "app_id", force: :cascade do |t|
    t.string "app_name",      limit: 50
    t.string "debug_mode",    limit: 5,          default: "false"
    t.text   "app_config",    limit: 65535
    t.string "status",        limit: 11,         default: "uninstalled"
    t.string "webpath",       limit: 20
    t.string "description",   limit: 255
    t.string "local_ver",     limit: 20
    t.string "remote_ver",    limit: 20
    t.string "author_name",   limit: 100
    t.string "author_url",    limit: 100
    t.string "author_email",  limit: 100
    t.string "dbver",         limit: 32
    t.text   "remote_config", limit: 4294967295
  end

  create_table "sdb_base_cache_expires", id: false, force: :cascade do |t|
    t.string  "type",   limit: 20,  null: false
    t.string  "name",   limit: 255, null: false
    t.integer "expire", limit: 4,   null: false
    t.string  "app",    limit: 50,  null: false
  end

  add_index "sdb_base_cache_expires", ["name"], name: "ind_name", using: :btree

  create_table "sdb_base_files", primary_key: "file_id", force: :cascade do |t|
    t.string  "file_path",        limit: 255
    t.string  "file_type",        limit: 7,   default: "public"
    t.integer "last_change_time", limit: 4
  end

  create_table "sdb_base_kvstore", force: :cascade do |t|
    t.string  "prefix",   limit: 255,                    null: false
    t.string  "key",      limit: 255,                    null: false
    t.text    "value",    limit: 4294967295
    t.integer "dateline", limit: 4
    t.integer "ttl",      limit: 4,          default: 0
  end

  add_index "sdb_base_kvstore", ["key"], name: "ind_key", using: :btree
  add_index "sdb_base_kvstore", ["prefix"], name: "ind_prefix", using: :btree

  create_table "sdb_base_network", primary_key: "node_id", force: :cascade do |t|
    t.string "node_name",   limit: 255,                  null: false
    t.string "node_url",    limit: 100,                  null: false
    t.string "node_api",    limit: 100,                  null: false
    t.string "link_status", limit: 6,   default: "wait", null: false
    t.string "node_detail", limit: 255
    t.string "token",       limit: 32
  end

  create_table "sdb_base_queue", primary_key: "queue_id", force: :cascade do |t|
    t.string  "queue_title",   limit: 50,                               null: false
    t.string  "status",        limit: 9,          default: "hibernate", null: false
    t.string  "worker",        limit: 200,                              null: false
    t.integer "start_time",    limit: 4,                                null: false
    t.integer "worker_active", limit: 4
    t.integer "total",         limit: 3
    t.integer "remaining",     limit: 3
    t.string  "cursor_id",     limit: 255,        default: "0",         null: false
    t.string  "runkey",        limit: 32
    t.string  "task_name",     limit: 50
    t.text    "params",        limit: 4294967295,                       null: false
    t.string  "errmsg",        limit: 255
  end

  add_index "sdb_base_queue", ["status"], name: "ind_status", using: :btree
  add_index "sdb_base_queue", ["worker"], name: "ind_worker", using: :btree
  add_index "sdb_base_queue", ["worker_active"], name: "ind_worker_active", using: :btree

  create_table "sdb_base_rpcnotify", force: :cascade do |t|
    t.string  "callback",   limit: 200,                   null: false
    t.string  "rsp",        limit: 4,                     null: false
    t.string  "msg",        limit: 255,                   null: false
    t.integer "notifytime", limit: 4,                     null: false
    t.string  "status",     limit: 5,   default: "false", null: false
  end

  add_index "sdb_base_rpcnotify", ["status"], name: "ind_status", using: :btree

  create_table "sdb_base_rpcpoll", id: false, force: :cascade do |t|
    t.string  "id",              limit: 32
    t.string  "process_id",      limit: 32
    t.string  "type",            limit: 8
    t.integer "calltime",        limit: 4
    t.integer "network",         limit: 3
    t.string  "method",          limit: 100
    t.text    "params",          limit: 4294967295
    t.string  "callback",        limit: 200
    t.text    "callback_params", limit: 65535
    t.text    "result",          limit: 65535
    t.integer "fail_times",      limit: 4,          default: 1,        null: false
    t.string  "status",          limit: 6,          default: "failed", null: false
  end

  add_index "sdb_base_rpcpoll", ["id", "type", "process_id"], name: "ind_rpc_task_id", unique: true, using: :btree
  add_index "sdb_base_rpcpoll", ["network"], name: "idx_c_network", using: :btree
  add_index "sdb_base_rpcpoll", ["process_id"], name: "ind_rpc_response_id", using: :btree

  create_table "sdb_base_task", primary_key: "task", force: :cascade do |t|
    t.integer "minute", limit: 4
    t.integer "hour",   limit: 4
    t.integer "day",    limit: 4
    t.integer "week",   limit: 4
    t.integer "month",  limit: 4
  end

  create_table "sdb_bdlink_link", id: false, force: :cascade do |t|
    t.string  "refer_id",     limit: 50,  default: "", null: false
    t.string  "refer_url",    limit: 200
    t.integer "refer_time",   limit: 4
    t.string  "c_refer_id",   limit: 50
    t.string  "c_refer_url",  limit: 200
    t.integer "c_refer_time", limit: 4
    t.string  "target_id",    limit: 32,               null: false
    t.string  "target_type",  limit: 50,               null: false
  end

  create_table "sdb_bdlink_list", force: :cascade do |t|
    t.string  "generatecode", limit: 255
    t.integer "time",         limit: 4
    t.integer "user_id",      limit: 3
    t.integer "validtime",    limit: 4
  end

  create_table "sdb_content_article_bodys", force: :cascade do |t|
    t.integer "article_id",      limit: 3,          null: false
    t.string  "tmpl_path",       limit: 50
    t.text    "content",         limit: 4294967295
    t.string  "seo_title",       limit: 100
    t.text    "seo_description", limit: 16777215
    t.string  "seo_keywords",    limit: 200
    t.text    "goods_info",      limit: 4294967295
    t.text    "hot_link",        limit: 4294967295
    t.integer "length",          limit: 4
    t.string  "image_id",        limit: 32
  end

  add_index "sdb_content_article_bodys", ["article_id"], name: "idx_c_article_id", using: :btree
  add_index "sdb_content_article_bodys", ["article_id"], name: "ind_article_id", unique: true, using: :btree

  create_table "sdb_content_article_indexs", primary_key: "article_id", force: :cascade do |t|
    t.string  "title",    limit: 200,                   null: false
    t.string  "type",     limit: 1,   default: "1",     null: false
    t.integer "node_id",  limit: 3,                     null: false
    t.string  "author",   limit: 50
    t.integer "pubtime",  limit: 4
    t.integer "uptime",   limit: 4
    t.string  "level",    limit: 1,   default: "1",     null: false
    t.string  "ifpub",    limit: 5,   default: "false", null: false
    t.integer "pv",       limit: 4,   default: 0
    t.string  "disabled", limit: 5,   default: "false", null: false
  end

  add_index "sdb_content_article_indexs", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_content_article_indexs", ["ifpub"], name: "ind_ifpub", using: :btree
  add_index "sdb_content_article_indexs", ["level"], name: "ind_level", using: :btree
  add_index "sdb_content_article_indexs", ["node_id"], name: "idx_c_node_id", using: :btree
  add_index "sdb_content_article_indexs", ["node_id"], name: "ind_node_id", using: :btree
  add_index "sdb_content_article_indexs", ["pubtime"], name: "ind_pubtime", using: :btree
  add_index "sdb_content_article_indexs", ["pv"], name: "ind_pv", using: :btree

  create_table "sdb_content_article_nodes", primary_key: "node_id", force: :cascade do |t|
    t.integer "parent_id",       limit: 3,          default: 0,       null: false
    t.boolean "node_depth",                         default: false,   null: false
    t.string  "node_name",       limit: 50,         default: "",      null: false
    t.string  "node_pagename",   limit: 50
    t.string  "node_path",       limit: 200
    t.string  "seo_title",       limit: 100
    t.text    "seo_description", limit: 16777215
    t.string  "seo_keywords",    limit: 200
    t.string  "has_children",    limit: 5,          default: "false", null: false
    t.string  "ifpub",           limit: 5,          default: "false", null: false
    t.string  "hasimage",        limit: 5,          default: "false", null: false
    t.integer "ordernum",        limit: 3,          default: 0,       null: false
    t.string  "homepage",        limit: 5,          default: "false"
    t.integer "uptime",          limit: 4
    t.string  "tmpl_path",       limit: 50
    t.string  "list_tmpl_path",  limit: 50
    t.text    "content",         limit: 4294967295
    t.string  "disabled",        limit: 5,          default: "false", null: false
  end

  add_index "sdb_content_article_nodes", ["disabled"], name: "ind_disabled", using: :btree
  add_index "sdb_content_article_nodes", ["ordernum"], name: "ind_ordernum", using: :btree

  create_table "sdb_couponlog_order_coupon_ref", force: :cascade do |t|
    t.integer "order_id",  limit: 8,   default: 0, null: false
    t.string  "memc_code", limit: 255
  end

  add_index "sdb_couponlog_order_coupon_ref", ["memc_code"], name: "ind_cpnscode", using: :btree
  add_index "sdb_couponlog_order_coupon_ref", ["order_id"], name: "idx_c_order_id", using: :btree

  create_table "sdb_couponlog_order_coupon_user", force: :cascade do |t|
    t.integer "order_id",     limit: 8,                            default: 0,   null: false
    t.integer "cpns_id",      limit: 3,                            default: 0,   null: false
    t.string  "cpns_name",    limit: 255
    t.integer "usetime",      limit: 4
    t.decimal "total_amount",             precision: 20, scale: 3, default: 0.0, null: false
    t.integer "member_id",    limit: 3
    t.string  "memc_code",    limit: 255
    t.string  "cpns_type",    limit: 1
  end

  add_index "sdb_couponlog_order_coupon_user", ["cpns_id"], name: "ind_cpnsid", using: :btree
  add_index "sdb_couponlog_order_coupon_user", ["cpns_name"], name: "ind_cpnsname", using: :btree
  add_index "sdb_couponlog_order_coupon_user", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "sdb_couponlog_order_coupon_user", ["memc_code"], name: "ind_cpnscode", using: :btree
  add_index "sdb_couponlog_order_coupon_user", ["order_id"], name: "idx_c_order_id", using: :btree

  create_table "sdb_dbeav_meta_register", primary_key: "mr_id", force: :cascade do |t|
    t.string "tbl_name", limit: 100,        null: false
    t.string "pk_name",  limit: 255,        null: false
    t.string "col_name", limit: 100,        null: false
    t.string "col_type", limit: 255,        null: false
    t.text   "col_desc", limit: 4294967295, null: false
  end

  add_index "sdb_dbeav_meta_register", ["col_name"], name: "idx_col_name", using: :btree
  add_index "sdb_dbeav_meta_register", ["tbl_name", "col_name"], name: "idx_tbl_col", using: :btree
  add_index "sdb_dbeav_meta_register", ["tbl_name"], name: "idx_tbl_name", using: :btree

  create_table "sdb_dbeav_meta_value_datetime", id: false, force: :cascade do |t|
    t.integer  "mr_id", limit: 3, null: false
    t.integer  "pk",    limit: 3, null: false
    t.datetime "value",           null: false
  end

  add_index "sdb_dbeav_meta_value_datetime", ["value"], name: "ind_value", using: :btree

  create_table "sdb_dbeav_meta_value_decimal", id: false, force: :cascade do |t|
    t.integer "mr_id", limit: 3,                                        null: false
    t.integer "pk",    limit: 3,                                        null: false
    t.decimal "value",           precision: 12, scale: 4, default: 0.0, null: false
  end

  add_index "sdb_dbeav_meta_value_decimal", ["value"], name: "ind_value", using: :btree

  create_table "sdb_dbeav_meta_value_int", id: false, force: :cascade do |t|
    t.integer "mr_id", limit: 3,             null: false
    t.integer "pk",    limit: 3,             null: false
    t.integer "value", limit: 4, default: 0, null: false
  end

  add_index "sdb_dbeav_meta_value_int", ["value"], name: "ind_value", using: :btree

  create_table "sdb_dbeav_meta_value_longtext", id: false, force: :cascade do |t|
    t.integer "mr_id", limit: 3,          null: false
    t.integer "pk",    limit: 3,          null: false
    t.text    "value", limit: 4294967295, null: false
  end

  create_table "sdb_dbeav_meta_value_text", id: false, force: :cascade do |t|
    t.integer "mr_id", limit: 3,     null: false
    t.integer "pk",    limit: 3,     null: false
    t.text    "value", limit: 65535, null: false
  end

  create_table "sdb_dbeav_meta_value_varchar", id: false, force: :cascade do |t|
    t.integer "mr_id", limit: 3,   default: 0,  null: false
    t.integer "pk",    limit: 3,                null: false
    t.string  "value", limit: 255, default: "", null: false
  end

  add_index "sdb_dbeav_meta_value_varchar", ["value"], name: "ind_value", using: :btree

  create_table "sdb_dbeav_recycle", primary_key: "item_id", force: :cascade do |t|
    t.string  "item_title", limit: 200,        null: false
    t.string  "item_type",  limit: 80,         null: false
    t.integer "drop_time",  limit: 4,          null: false
    t.text    "item_sdf",   limit: 4294967295, null: false
  end

  create_table "sdb_desktop_filter", primary_key: "filter_id", force: :cascade do |t|
    t.string  "filter_name",  limit: 20
    t.integer "user_id",      limit: 3,                  null: false
    t.string  "model",        limit: 100,                null: false
    t.text    "filter_query", limit: 65535
    t.string  "ctl",          limit: 100,   default: "", null: false
    t.string  "app",          limit: 50,    default: "", null: false
    t.string  "act",          limit: 50,    default: "", null: false
    t.integer "create_time",  limit: 4,     default: 0,  null: false
  end

  create_table "sdb_desktop_flow", primary_key: "flow_id", force: :cascade do |t|
    t.string  "flow_from", limit: 8,     default: "system",  null: false
    t.integer "from_id",   limit: 3,     default: 0
    t.string  "subject",   limit: 50,    default: "",        null: false
    t.string  "flow_desc", limit: 100,   default: "",        null: false
    t.text    "body",      limit: 65535,                     null: false
    t.string  "flow_ip",   limit: 20,    default: "",        null: false
    t.string  "send_mode", limit: 9,     default: "direct",  null: false
    t.string  "flow_type", limit: 32,    default: "default", null: false
    t.integer "send_time", limit: 4,                         null: false
  end

  create_table "sdb_desktop_hasrole", id: false, force: :cascade do |t|
    t.integer "user_id", limit: 3, null: false
    t.integer "role_id", limit: 3, null: false
  end

  create_table "sdb_desktop_menus", primary_key: "menu_id", force: :cascade do |t|
    t.string  "menu_type",  limit: 80,                      null: false
    t.string  "app_id",     limit: 32,                      null: false
    t.string  "workground", limit: 200
    t.string  "menu_group", limit: 200
    t.string  "menu_title", limit: 100
    t.string  "menu_path",  limit: 255
    t.string  "disabled",   limit: 5,     default: "false"
    t.string  "display",    limit: 5,     default: "false"
    t.string  "permission", limit: 80
    t.text    "addon",      limit: 65535
    t.string  "target",     limit: 10,    default: ""
    t.integer "menu_order", limit: 3,     default: 0
    t.string  "parent",     limit: 255,   default: "0"
  end

  add_index "sdb_desktop_menus", ["app_id"], name: "idx_c_app_id", using: :btree
  add_index "sdb_desktop_menus", ["menu_order"], name: "ind_menu_order", using: :btree
  add_index "sdb_desktop_menus", ["menu_path"], name: "ind_menu_path", using: :btree
  add_index "sdb_desktop_menus", ["menu_type"], name: "ind_menu_type", using: :btree

  create_table "sdb_desktop_recycle", primary_key: "item_id", force: :cascade do |t|
    t.string  "item_title", limit: 200
    t.string  "item_type",  limit: 80,         null: false
    t.string  "app_key",    limit: 80,         null: false
    t.integer "drop_time",  limit: 4,          null: false
    t.text    "item_sdf",   limit: 4294967295, null: false
    t.string  "permission", limit: 80
  end

  create_table "sdb_desktop_role_flow", id: false, force: :cascade do |t|
    t.integer "role_id", limit: 3, null: false
    t.integer "flow_id", limit: 3, null: false
  end

  create_table "sdb_desktop_roles", primary_key: "role_id", force: :cascade do |t|
    t.string "role_name",  limit: 100,   null: false
    t.text   "workground", limit: 65535
  end

  create_table "sdb_desktop_tag", primary_key: "tag_id", force: :cascade do |t|
    t.string  "tag_name",    limit: 20,  default: "",       null: false
    t.string  "tag_mode",    limit: 6,   default: "normal", null: false
    t.string  "app_id",      limit: 32,                     null: false
    t.string  "tag_type",    limit: 20,  default: "",       null: false
    t.string  "tag_abbr",    limit: 150, default: "",       null: false
    t.string  "tag_bgcolor", limit: 7,   default: "",       null: false
    t.string  "tag_fgcolor", limit: 7,   default: "",       null: false
    t.string  "tag_filter",  limit: 255, default: "",       null: false
    t.integer "rel_count",   limit: 3,   default: 0,        null: false
  end

  add_index "sdb_desktop_tag", ["tag_name"], name: "ind_name", using: :btree
  add_index "sdb_desktop_tag", ["tag_type"], name: "ind_type", using: :btree

  create_table "sdb_desktop_tag_ext", force: :cascade do |t|
    t.integer  "tag_id",    limit: 4
    t.string   "tag_name",  limit: 255
    t.datetime "deadline"
    t.string   "cover_url", limit: 255
    t.string   "issue_no",  limit: 255
    t.string   "title",     limit: 255
    t.boolean  "disabled",              default: false
  end

  create_table "sdb_desktop_tag_rel", id: false, force: :cascade do |t|
    t.integer "tag_id",   limit: 3,  default: 0,   null: false
    t.string  "rel_id",   limit: 32, default: "0", null: false
    t.string  "app_id",   limit: 32,               null: false
    t.string  "tag_type", limit: 20, default: "",  null: false
  end

  create_table "sdb_desktop_user_flow", id: false, force: :cascade do |t|
    t.integer "user_id",     limit: 3,                    null: false
    t.integer "flow_id",     limit: 3,                    null: false
    t.string  "unread",      limit: 5,  default: "true",  null: false
    t.string  "note",        limit: 50, default: ""
    t.string  "has_star",    limit: 5,  default: "false", null: false
    t.string  "keep_unread", limit: 5,  default: "false", null: false
  end

  create_table "sdb_desktop_users", primary_key: "user_id", force: :cascade do |t|
    t.string  "status",     limit: 1,          default: "0",     null: false
    t.string  "name",       limit: 30
    t.integer "lastlogin",  limit: 4,          default: 0,       null: false
    t.text    "config",     limit: 4294967295
    t.text    "favorite",   limit: 4294967295
    t.string  "super",      limit: 1,          default: "0",     null: false
    t.string  "lastip",     limit: 20
    t.integer "logincount", limit: 3,          default: 0,       null: false
    t.string  "disabled",   limit: 5,          default: "false", null: false
    t.string  "op_no",      limit: 50
    t.text    "memo",       limit: 65535
  end

  add_index "sdb_desktop_users", ["disabled"], name: "ind_disabled", using: :btree

  create_table "sdb_ectools_analysis", force: :cascade do |t|
    t.string  "service",  limit: 100,             null: false
    t.string  "interval", limit: 4,               null: false
    t.integer "modify",   limit: 4,   default: 0, null: false
  end

  create_table "sdb_ectools_analysis_logs", force: :cascade do |t|
    t.integer "analysis_id", limit: 3,                null: false
    t.integer "type",        limit: 3,  default: 0,   null: false
    t.integer "target",      limit: 3,  default: 0,   null: false
    t.integer "flag",        limit: 3,  default: 0,   null: false
    t.float   "value",       limit: 24, default: 0.0, null: false
    t.integer "time",        limit: 4,                null: false
  end

  add_index "sdb_ectools_analysis_logs", ["analysis_id"], name: "ind_analysis_id", using: :btree
  add_index "sdb_ectools_analysis_logs", ["target"], name: "ind_target", using: :btree
  add_index "sdb_ectools_analysis_logs", ["time"], name: "ind_time", using: :btree
  add_index "sdb_ectools_analysis_logs", ["type"], name: "ind_type", using: :btree

  create_table "sdb_ectools_currency", primary_key: "cur_id", force: :cascade do |t|
    t.string  "cur_name",    limit: 20,                          default: "",      null: false
    t.string  "cur_sign",    limit: 5
    t.string  "cur_code",    limit: 8,                           default: "",      null: false
    t.decimal "cur_rate",               precision: 10, scale: 4, default: 1.0,     null: false
    t.string  "cur_default", limit: 5,                           default: "false", null: false
  end

  add_index "sdb_ectools_currency", ["cur_code"], name: "uni_ident_type", unique: true, using: :btree

  create_table "sdb_ectools_order_bills", id: false, force: :cascade do |t|
    t.integer "rel_id",     limit: 8,                           default: 0,          null: false
    t.string  "bill_type",  limit: 8,                           default: "payments", null: false
    t.string  "pay_object", limit: 16,                          default: "order",    null: false
    t.string  "bill_id",    limit: 20,                                               null: false
    t.decimal "money",                 precision: 20, scale: 3
  end

  create_table "sdb_ectools_payments", primary_key: "payment_id", force: :cascade do |t|
    t.decimal "money",                          precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "cur_money",                      precision: 20, scale: 3, default: 0.0,      null: false
    t.string  "member_id",   limit: 100
    t.string  "status",      limit: 8,                                   default: "ready",  null: false
    t.string  "pay_name",    limit: 100
    t.string  "pay_type",    limit: 7,                                   default: "online", null: false
    t.integer "t_payed",     limit: 4
    t.integer "op_id",       limit: 3
    t.string  "payment_bn",  limit: 32,                                  default: ""
    t.string  "account",     limit: 50
    t.string  "bank",        limit: 50
    t.string  "pay_account", limit: 50
    t.string  "currency",    limit: 10
    t.decimal "paycost",                        precision: 20, scale: 3
    t.string  "pay_app_id",  limit: 100,                                 default: "0",      null: false
    t.string  "pay_ver",     limit: 50
    t.string  "ip",          limit: 20
    t.integer "t_begin",     limit: 4
    t.integer "t_confirm",   limit: 4
    t.text    "memo",        limit: 4294967295
    t.string  "return_url",  limit: 100
    t.string  "disabled",    limit: 5,                                   default: "false"
    t.string  "trade_no",    limit: 30
  end

  add_index "sdb_ectools_payments", ["disabled"], name: "ind_disabled", using: :btree

  create_table "sdb_ectools_refunds", primary_key: "refund_id", force: :cascade do |t|
    t.decimal "money",                          precision: 20, scale: 3, default: 0.0,      null: false
    t.decimal "cur_money",                      precision: 20, scale: 3, default: 0.0,      null: false
    t.string  "member_id",   limit: 100
    t.string  "account",     limit: 50
    t.string  "bank",        limit: 50
    t.string  "pay_account", limit: 50
    t.string  "currency",    limit: 10
    t.decimal "paycost",                        precision: 20, scale: 3
    t.string  "pay_type",    limit: 7,                                   default: "online", null: false
    t.string  "status",      limit: 8,                                   default: "ready",  null: false
    t.string  "pay_name",    limit: 100
    t.string  "pay_ver",     limit: 50
    t.integer "op_id",       limit: 3
    t.string  "refund_bn",   limit: 32,                                  default: ""
    t.string  "pay_app_id",  limit: 100,                                 default: "0",      null: false
    t.integer "t_begin",     limit: 4
    t.integer "t_payed",     limit: 4
    t.integer "t_confirm",   limit: 4
    t.text    "memo",        limit: 4294967295
    t.string  "disabled",    limit: 5,                                   default: "false"
    t.string  "trade_no",    limit: 30
  end

  add_index "sdb_ectools_refunds", ["disabled"], name: "ind_disabled", using: :btree

  create_table "sdb_ectools_regions", primary_key: "region_id", force: :cascade do |t|
    t.string  "local_name",   limit: 50,  default: "",      null: false
    t.string  "package",      limit: 20,  default: "",      null: false
    t.integer "p_region_id",  limit: 4
    t.string  "region_path",  limit: 255
    t.integer "region_grade", limit: 3
    t.string  "p_1",          limit: 50
    t.string  "p_2",          limit: 50
    t.integer "ordernum",     limit: 3
    t.string  "disabled",     limit: 5,   default: "false"
  end

  add_index "sdb_ectools_regions", ["p_region_id", "region_grade", "local_name"], name: "ind_p_regions_id", unique: true, using: :btree

  create_table "sdb_express_dly_center", primary_key: "dly_center_id", force: :cascade do |t|
    t.string "name",      limit: 50,         default: "0",     null: false
    t.string "address",   limit: 200,                          null: false
    t.string "region",    limit: 255
    t.string "zip",       limit: 20
    t.string "phone",     limit: 100
    t.string "uname",     limit: 100
    t.string "cellphone", limit: 100
    t.string "sex",       limit: 6,          default: "male"
    t.text   "memo",      limit: 4294967295
    t.string "disabled",  limit: 5,          default: "false", null: false
  end

  create_table "sdb_express_print_tmpl", primary_key: "prt_tmpl_id", force: :cascade do |t|
    t.string  "prt_tmpl_title",   limit: 100,        default: "0",     null: false
    t.string  "shortcut",         limit: 5,          default: "false"
    t.integer "prt_tmpl_width",   limit: 1,                            null: false
    t.integer "prt_tmpl_height",  limit: 1,                            null: false
    t.integer "prt_tmpl_offsetx", limit: 1,          default: 0,       null: false
    t.integer "prt_tmpl_offsety", limit: 1,          default: 0,       null: false
    t.text    "prt_tmpl_data",    limit: 4294967295
    t.string  "disabled",         limit: 5,          default: "false", null: false
  end

  create_table "sdb_gift_cat", primary_key: "cat_id", force: :cascade do |t|
    t.string  "cat_name", limit: 100, default: "",      null: false
    t.integer "p_order",  limit: 3,   default: 1
    t.string  "ifpub",    limit: 5,   default: "true"
    t.string  "disabled", limit: 5,   default: "false", null: false
  end

  create_table "sdb_gift_ref", primary_key: "product_id", force: :cascade do |t|
    t.string  "bn",            limit: 200
    t.integer "goods_id",      limit: 8,   default: 0,       null: false
    t.integer "cat_id",        limit: 3,   default: 0,       null: false
    t.string  "name",          limit: 200, default: "",      null: false
    t.string  "member_lv_ids", limit: 255, default: ""
    t.string  "ifrecommend",   limit: 5,   default: "false"
    t.string  "marketable",    limit: 5,   default: "true"
    t.integer "consume_score", limit: 3,   default: 0
    t.integer "from_time",     limit: 4
    t.integer "to_time",       limit: 4
    t.integer "order",         limit: 3,   default: 30,      null: false
    t.integer "max_buy_store", limit: 3,   default: 0,       null: false
    t.integer "max_limit",     limit: 3
    t.integer "real_limit",    limit: 3,   default: 0,       null: false
    t.string  "brief",         limit: 255
  end

  add_index "sdb_gift_ref", ["ifrecommend"], name: "index_status", using: :btree
  add_index "sdb_gift_ref", ["product_id"], name: "index_gift", using: :btree

  create_table "sdb_groupactivity_order_act", force: :cascade do |t|
    t.integer "order_id",           limit: 8
    t.integer "act_id",             limit: 3,                           default: 0
    t.string  "extension_code",     limit: 30,                          default: "create"
    t.decimal "group_total_amount",            precision: 20, scale: 3, default: 0.0,      null: false
    t.integer "last_change_time",   limit: 4,                           default: 0,        null: false
    t.integer "quantity",           limit: 4,                           default: 0
    t.integer "member_id",          limit: 3
    t.string  "disabled",           limit: 5,                           default: "false"
    t.integer "createtime",         limit: 4
  end

  add_index "sdb_groupactivity_order_act", ["act_id"], name: "ind_act", using: :btree
  add_index "sdb_groupactivity_order_act", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "sdb_groupactivity_order_act", ["order_id"], name: "idx_c_order_id", using: :btree
  add_index "sdb_groupactivity_order_act", ["order_id"], name: "ind_order", using: :btree

  create_table "sdb_groupactivity_purchase", primary_key: "act_id", force: :cascade do |t|
    t.integer "gid",           limit: 8,                                                     null: false
    t.string  "name",          limit: 200
    t.integer "start_value",   limit: 4
    t.integer "start_time",    limit: 4
    t.integer "end_time",      limit: 4
    t.integer "buy",           limit: 3,                                   default: 0
    t.integer "min_buy",       limit: 3,                                   default: 0
    t.integer "max_buy",       limit: 3,                                   default: 0
    t.integer "orderlimit",    limit: 3
    t.integer "userlimit",     limit: 3
    t.string  "alluser",       limit: 5,                                   default: "true",  null: false
    t.string  "member_lv_ids", limit: 100,                                 default: "",      null: false
    t.integer "score",         limit: 3
    t.decimal "price",                            precision: 20, scale: 3, default: 0.0
    t.string  "pro_type",      limit: 1,                                   default: "2"
    t.integer "postage",       limit: 3,                                   default: 0
    t.text    "intro",         limit: 4294967295
    t.string  "state",         limit: 1,                                   default: "1"
    t.string  "act_open",      limit: 5,                                   default: "false"
    t.integer "last_modified", limit: 4
  end

  add_index "sdb_groupactivity_purchase", ["act_id"], name: "act_index", using: :btree
  add_index "sdb_groupactivity_purchase", ["act_id"], name: "gid_uni", unique: true, using: :btree
  add_index "sdb_groupactivity_purchase", ["gid"], name: "idx_c_gid", using: :btree

  create_table "sdb_image_image", primary_key: "image_id", force: :cascade do |t|
    t.string  "storage",       limit: 50,  default: "filesystem", null: false
    t.string  "image_name",    limit: 50
    t.string  "ident",         limit: 200,                        null: false
    t.string  "url",           limit: 200,                        null: false
    t.string  "l_ident",       limit: 200
    t.string  "l_url",         limit: 200
    t.string  "m_ident",       limit: 200
    t.string  "m_url",         limit: 200
    t.string  "s_ident",       limit: 200
    t.string  "s_url",         limit: 200
    t.integer "width",         limit: 3
    t.integer "height",        limit: 3
    t.string  "watermark",     limit: 5,   default: "false"
    t.integer "last_modified", limit: 4,   default: 0,            null: false
  end

  create_table "sdb_image_image_attach", primary_key: "attach_id", force: :cascade do |t|
    t.integer "target_id",     limit: 8,  default: 0,   null: false
    t.string  "target_type",   limit: 20, default: "0", null: false
    t.string  "image_id",      limit: 32, default: "0", null: false
    t.integer "last_modified", limit: 4,  default: 0,   null: false
  end

  add_index "sdb_image_image_attach", ["image_id"], name: "idx_c_image_id", using: :btree
  add_index "sdb_image_image_attach", ["target_id", "target_type"], name: "index_1", using: :btree

  create_table "sdb_imodec_addresses", force: :cascade do |t|
    t.string  "name",             limit: 255
    t.float   "latitude",         limit: 24
    t.float   "longitude",        limit: 24
    t.integer "addressable_id",   limit: 4
    t.string  "addressable_type", limit: 255
  end

  create_table "sdb_imodec_comments", force: :cascade do |t|
    t.integer  "member_id",        limit: 4
    t.text     "content",          limit: 65535
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "sdb_imodec_configs", force: :cascade do |t|
    t.string "name",  limit: 255
    t.string "key",   limit: 255
    t.text   "value", limit: 65535
  end

  create_table "sdb_imodec_coupon_downloads", force: :cascade do |t|
    t.integer  "offline_coupon_id", limit: 4
    t.integer  "member_id",         limit: 4
    t.datetime "downloaded_at"
  end

  create_table "sdb_imodec_coupons", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "desc",           limit: 255
    t.integer  "priority",       limit: 4
    t.datetime "begin_at"
    t.datetime "end_at"
    t.boolean  "exclusive"
    t.boolean  "enable"
    t.string   "coupon_type",    limit: 255
    t.string   "coupon_key",     limit: 255
    t.integer  "quantity",       limit: 4,     default: 0
    t.string   "condition_type", limit: 255
    t.text     "condition_val",  limit: 65535
    t.string   "action_type",    limit: 255
    t.string   "action_val",     limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "coupon_prefix",  limit: 255
  end

  create_table "sdb_imodec_emails", force: :cascade do |t|
    t.string   "addr",       limit: 255
    t.datetime "sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sdb_imodec_homes", force: :cascade do |t|
    t.text     "body",        limit: 65535
    t.string   "note",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.text     "sliders",     limit: 65535
    t.text     "keywords",    limit: 65535
    t.text     "pops",        limit: 65535
    t.text     "clothing",    limit: 65535
    t.text     "bags",        limit: 65535
    t.text     "suits",       limit: 65535
    t.text     "hots",        limit: 65535
    t.integer  "supplier_id", limit: 4
  end

  create_table "sdb_imodec_inventory_log", force: :cascade do |t|
    t.binary  "in_or_out",     limit: 1
    t.integer "order_item_id", limit: 4
    t.string  "order_id",      limit: 45
    t.integer "member_id",     limit: 4
    t.integer "goods_id",      limit: 4
    t.integer "product_id",    limit: 4
    t.decimal "price",                     precision: 10, scale: 2
    t.integer "quantity",      limit: 4
    t.string  "name",          limit: 255
    t.string  "bn",            limit: 45
    t.string  "barcode",       limit: 45
    t.integer "createtime",    limit: 4
  end

  create_table "sdb_imodec_inventorys", id: false, force: :cascade do |t|
    t.integer "member_id",  limit: 4
    t.integer "goods_id",   limit: 4
    t.integer "product_id", limit: 4
    t.string  "bn",         limit: 45
    t.string  "barcode",    limit: 45
    t.string  "name",       limit: 255
    t.decimal "price",                  precision: 10, scale: 2
    t.integer "quantity",   limit: 4
  end

  create_table "sdb_imodec_labelables", force: :cascade do |t|
    t.integer "labelable_id",   limit: 4
    t.string  "labelable_type", limit: 255
    t.integer "label_id",       limit: 4
  end

  create_table "sdb_imodec_labels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sdb_imodec_offline_coupons", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "code",           limit: 255
    t.float    "discount",       limit: 24
    t.string   "sms_text",       limit: 255
    t.integer  "brand_id",       limit: 4
    t.text     "cover_urls",     limit: 65535
    t.boolean  "published"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.integer  "download_times", limit: 4,     default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "sdb_imodec_order_promotions", force: :cascade do |t|
    t.integer  "order_id",       limit: 8
    t.integer  "pmt_id",         limit: 4
    t.string   "pmt_type",       limit: 255
    t.decimal  "pmt_amount",                 precision: 10, scale: 3, default: 0.0
    t.string   "pmt_name",       limit: 255
    t.string   "pmt_desc",       limit: 255
    t.integer  "user_coupon_id", limit: 4
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.string   "coupon_code",    limit: 255
  end

  create_table "sdb_imodec_payment_logs", force: :cascade do |t|
    t.string   "pay_name",       limit: 255
    t.string   "payment_id",     limit: 255
    t.integer  "order_id",       limit: 8
    t.string   "request_ip",     limit: 255
    t.text     "request_params", limit: 65535
    t.datetime "requested_at"
    t.string   "return_ip",      limit: 255
    t.text     "return_params",  limit: 65535
    t.datetime "returned_at"
    t.string   "notify_ip",      limit: 255
    t.text     "notify_params",  limit: 65535
    t.datetime "notified_at"
    t.string   "result",         limit: 255
  end

  create_table "sdb_imodec_promotions", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "desc",           limit: 255
    t.integer  "priority",       limit: 4
    t.datetime "begin_at"
    t.datetime "end_at"
    t.boolean  "exclusive"
    t.text     "goods",          limit: 65535
    t.string   "condition_type", limit: 255
    t.string   "condition_val",  limit: 255
    t.string   "action_type",    limit: 255
    t.text     "action_val",     limit: 65535
    t.boolean  "enable"
    t.string   "promotion_type", limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "field_name",     limit: 255
    t.string   "in_or_not",      limit: 255
    t.text     "field_vals",     limit: 65535
  end

  create_table "sdb_imodec_recommend_log", force: :cascade do |t|
    t.string  "wechat_id",      limit: 255
    t.string  "goods_id",       limit: 45
    t.integer "member_id",      limit: 4
    t.string  "terminal_info",  limit: 2000
    t.string  "remote_ip",      limit: 45
    t.integer "access_time",    limit: 4
    t.string  "wechat_user_id", limit: 255
    t.string  "link",           limit: 255
  end

  add_index "sdb_imodec_recommend_log", ["access_time"], name: "access_time_UNIQUE", unique: true, using: :btree
  add_index "sdb_imodec_recommend_log", ["id"], name: "id_UNIQUE", unique: true, using: :btree

  create_table "sdb_imodec_seo", force: :cascade do |t|
    t.string  "title",        limit: 255
    t.string  "keywords",     limit: 255
    t.string  "description",  limit: 255
    t.integer "metable_id",   limit: 4
    t.string  "metable_type", limit: 255
    t.string  "path",         limit: 255
    t.string  "params",       limit: 255
  end

  create_table "sdb_imodec_suppliers", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.binary   "status",                  limit: 1
    t.integer  "member_id",               limit: 4
    t.string   "url",                     limit: 255
    t.string   "logo",                    limit: 255
    t.string   "desc",                    limit: 255
    t.text     "goods_area",              limit: 65535
    t.datetime "updated_at",                                                                    null: false
    t.datetime "created_at",                                                                    null: false
    t.string   "address",                 limit: 45
    t.string   "tel",                     limit: 45
    t.string   "owner",                   limit: 45
    t.string   "owner_id",                limit: 45
    t.string   "weixin_name",             limit: 45
    t.string   "weixin_account",          limit: 45
    t.string   "weixin_password",         limit: 45
    t.string   "weixin_secret_key",       limit: 255
    t.string   "weixin_token",            limit: 255
    t.string   "weixin_appid",            limit: 45
    t.string   "weixin_appsecret",        limit: 45
    t.string   "weixin_openid",           limit: 45
    t.string   "vmanager",                limit: 45
    t.string   "vmanager_dpt_position",   limit: 45
    t.string   "vmanager_id",             limit: 45
    t.string   "vmanager_mobile",         limit: 45
    t.string   "vmanager_email",          limit: 45
    t.string   "license",                 limit: 45
    t.string   "layout",                  limit: 45
    t.string   "menu",                    limit: 5000
    t.string   "company_name",            limit: 45
    t.decimal  "commission_platform",                   precision: 10, scale: 2
    t.decimal  "commission_promotion",                  precision: 10, scale: 2, default: 0.01
    t.integer  "commission_confirm_days", limit: 4,                              default: 14
  end

  add_index "sdb_imodec_suppliers", ["weixin_secret_key"], name: "index_sdb_imodec_suppliers_on_weixin_secret_key", using: :btree
  add_index "sdb_imodec_suppliers", ["weixin_token"], name: "index_sdb_imodec_suppliers_on_weixin_token", using: :btree

  create_table "sdb_imodec_user_coupons", force: :cascade do |t|
    t.integer  "member_id",   limit: 4
    t.integer  "coupon_id",   limit: 4
    t.datetime "used_at"
    t.integer  "used_times",  limit: 4
    t.string   "coupon_code", limit: 255
  end

  create_table "sdb_imodec_virtual_goods", force: :cascade do |t|
    t.integer  "brand_id",   limit: 4
    t.integer  "cat_id",     limit: 4
    t.string   "bn",         limit: 255
    t.string   "name",       limit: 255
    t.decimal  "price",                    precision: 10
    t.boolean  "marketable"
    t.integer  "uptime",     limit: 4
    t.integer  "downtime",   limit: 4
    t.text     "desc",       limit: 65535
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "slug",       limit: 255
  end

  create_table "sdb_logisticstrack_logistic_log", force: :cascade do |t|
    t.integer "dtline",       limit: 4,                  null: false
    t.string  "delivery_id",  limit: 20,                 null: false
    t.integer "pulltimes",    limit: 3
    t.string  "dly_corp",     limit: 200,   default: ""
    t.string  "logistic_no",  limit: 64,    default: ""
    t.text    "logistic_log", limit: 65535
  end

  add_index "sdb_logisticstrack_logistic_log", ["delivery_id"], name: "ind_delivery_id", unique: true, using: :btree

  create_table "sdb_openid_openid", primary_key: "openid", force: :cascade do |t|
    t.integer "member_id",       limit: 3
    t.integer "provider_openid", limit: 4
    t.string  "provider_code",   limit: 50
    t.string  "nickname",        limit: 50
    t.string  "realname",        limit: 50
    t.string  "email",           limit: 200
    t.string  "gender",          limit: 1
    t.string  "address",         limit: 255
    t.string  "avatar",          limit: 255
  end

  add_index "sdb_openid_openid", ["member_id"], name: "idx_c_member_id", using: :btree

  create_table "sdb_operatorlogmanage_logs", force: :cascade do |t|
    t.string  "username", limit: 50,  null: false
    t.string  "realname", limit: 50,  null: false
    t.integer "dateline", limit: 4,   null: false
    t.string  "app",      limit: 50,  null: false
    t.string  "ctl",      limit: 50,  null: false
    t.string  "act",      limit: 50,  null: false
    t.string  "operate",  limit: 255, null: false
    t.string  "memo",     limit: 255
  end

  add_index "sdb_operatorlogmanage_logs", ["dateline"], name: "ind_dateline", using: :btree
  add_index "sdb_operatorlogmanage_logs", ["username"], name: "ind_username", using: :btree

  create_table "sdb_operatorlogmanage_register", force: :cascade do |t|
    t.string "app",     limit: 50,  null: false
    t.string "ctl",     limit: 50,  null: false
    t.string "act",     limit: 50,  null: false
    t.string "operate", limit: 255, null: false
  end

  add_index "sdb_operatorlogmanage_register", ["app", "ctl", "act"], name: "ind_index", unique: true, using: :btree

  create_table "sdb_pam_account", primary_key: "account_id", force: :cascade do |t|
    t.string  "account_type",    limit: 30
    t.string  "login_name",      limit: 100,                   null: false
    t.string  "login_password",  limit: 32,                    null: false
    t.string  "disabled",        limit: 5,   default: "false"
    t.integer "createtime",      limit: 4
    t.integer "supplier_id",     limit: 4
    t.integer "shop_id",         limit: 8
    t.integer "role",            limit: 2,   default: 0
    t.string  "wechat_openid",   limit: 40
    t.string  "wechat_nickname", limit: 30
    t.string  "wechat_avatar",   limit: 255
  end

  add_index "sdb_pam_account", ["account_type", "login_name"], name: "account", unique: true, using: :btree

  create_table "sdb_pam_auth", primary_key: "auth_id", force: :cascade do |t|
    t.integer "account_id", limit: 3
    t.string  "module_uid", limit: 50
    t.string  "module",     limit: 50
    t.text    "data",       limit: 65535
  end

  add_index "sdb_pam_auth", ["account_id"], name: "idx_c_account_id", using: :btree
  add_index "sdb_pam_auth", ["module", "account_id"], name: "account_id", unique: true, using: :btree
  add_index "sdb_pam_auth", ["module", "module_uid"], name: "module_uid", unique: true, using: :btree

  create_table "sdb_pam_auth_ext", force: :cascade do |t|
    t.integer  "account_id",   limit: 4
    t.string   "access_token", limit: 255
    t.integer  "expires_in",   limit: 4
    t.integer  "expires_at",   limit: 4
    t.string   "uid",          limit: 255
    t.string   "provider",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sdb_pointprofessional_member_point_task", id: false, force: :cascade do |t|
    t.integer "member_id",  limit: 3,   default: 0,   null: false
    t.string  "task_name",  limit: 50,  default: "0", null: false
    t.integer "point",      limit: 4,   default: 0,   null: false
    t.integer "addtime",    limit: 4,   default: 0,   null: false
    t.integer "enddate",    limit: 4,   default: 0,   null: false
    t.integer "related_id", limit: 8
    t.string  "task_type",  limit: 1,   default: "1", null: false
    t.string  "remark",     limit: 100, default: ""
    t.string  "operator",   limit: 50
    t.string  "status",     limit: 1,   default: "0", null: false
  end

  add_index "sdb_pointprofessional_member_point_task", ["member_id"], name: "idx_c_member_id", using: :btree
  add_index "sdb_pointprofessional_member_point_task", ["status"], name: "ind_status", using: :btree
  add_index "sdb_pointprofessional_member_point_task", ["task_type"], name: "ind_task_type", using: :btree

  create_table "sdb_recommended_goods", id: false, force: :cascade do |t|
    t.integer "primary_goods_id",   limit: 8,   null: false
    t.string  "secondary_goods_id", limit: 200
    t.integer "last_modified",      limit: 4,   null: false
  end

  add_index "sdb_recommended_goods", ["primary_goods_id"], name: "ind_goods_id", using: :btree

  create_table "sdb_recommended_goods_period", id: false, force: :cascade do |t|
    t.integer "primary_goods_id",   limit: 8,   null: false
    t.string  "secondary_goods_id", limit: 200
    t.integer "last_modified",      limit: 4,   null: false
  end

  add_index "sdb_recommended_goods_period", ["primary_goods_id"], name: "ind_goods_id", using: :btree

  create_table "sdb_site_link", primary_key: "link_id", force: :cascade do |t|
    t.string  "link_name", limit: 128, default: "",      null: false
    t.string  "href",      limit: 255, default: "",      null: false
    t.string  "image_url", limit: 255
    t.integer "orderlist", limit: 3,   default: 0,       null: false
    t.string  "hidden",    limit: 5,   default: "false", null: false
  end

  create_table "sdb_site_menus", force: :cascade do |t|
    t.string  "title",           limit: 100,        default: "",      null: false
    t.string  "app",             limit: 50,         default: ""
    t.string  "ctl",             limit: 50,         default: ""
    t.string  "act",             limit: 50,         default: ""
    t.string  "custom_url",      limit: 200,        default: ""
    t.integer "display_order",   limit: 1,          default: 0,       null: false
    t.string  "target_blank",    limit: 5,          default: "false", null: false
    t.string  "hidden",          limit: 5,          default: "false", null: false
    t.text    "params",          limit: 4294967295
    t.text    "config",          limit: 4294967295
    t.integer "update_modified", limit: 4
  end

  create_table "sdb_site_modules", force: :cascade do |t|
    t.string  "app",             limit: 50,  default: "",      null: false
    t.string  "ctl",             limit: 50,  default: "",      null: false
    t.string  "path",            limit: 50,  default: "",      null: false
    t.string  "extension",       limit: 10,  default: "",      null: false
    t.string  "title",           limit: 50,  default: "",      null: false
    t.string  "allow_menus",     limit: 255, default: "",      null: false
    t.string  "is_native",       limit: 5,   default: "false", null: false
    t.string  "enable",          limit: 5,   default: "false", null: false
    t.integer "update_modified", limit: 4
  end

  create_table "sdb_site_route_statics", force: :cascade do |t|
    t.string "static", limit: 255,                  null: false
    t.string "url",    limit: 255,                  null: false
    t.string "enable", limit: 5,   default: "true", null: false
  end

  create_table "sdb_site_seo", force: :cascade do |t|
    t.string  "app",             limit: 50,         default: "", null: false
    t.string  "ctl",             limit: 50,         default: "", null: false
    t.string  "act",             limit: 50,         default: "", null: false
    t.string  "title",           limit: 50,         default: "", null: false
    t.text    "config",          limit: 4294967295
    t.text    "param",           limit: 4294967295
    t.integer "update_modified", limit: 4
  end

  create_table "shops", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "shops", ["account_id"], name: "index_shops_on_account_id", using: :btree

  create_table "x_articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.string   "subject",    limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "subtitle",   limit: 255
  end

  create_table "x_contacts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "post_code",  limit: 255
    t.string   "sex",        limit: 255
    t.string   "tel",        limit: 255
    t.string   "mobile",     limit: 255
    t.string   "subject",    limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
