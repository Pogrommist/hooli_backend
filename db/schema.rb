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

ActiveRecord::Schema.define(version: 2022_07_19_160623) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "base_trading_strategies_step_items", force: :cascade do |t|
    t.string "strategy_item_type"
    t.bigint "strategy_item_id"
    t.bigint "trading_strategy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["strategy_item_type", "strategy_item_id"], name: "index_strategy_item_on_id_and_type"
    t.index ["trading_strategy_id"], name: "index_base_trading_strategies_step_items_on_trading_strategy_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "trading_strategies", force: :cascade do |t|
    t.bigint "user_id"
    t.boolean "is_running", default: false
    t.string "name"
    t.boolean "is_public", default: false
    t.string "integration_with"
    t.float "daily_limit", default: 0.0
    t.float "strategy_limit", default: 0.0
    t.string "strategy_currency"
    t.string "strategy_token_in"
    t.string "strategy_token_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trading_strategies_on_user_id"
  end

  create_table "trading_strategies_step_buys", force: :cascade do |t|
    t.integer "step_index", null: false
    t.string "step_type"
    t.float "step_limit", default: 0.0
    t.float "step_limit_percent", default: 0.0
    t.integer "status", null: false
    t.string "step_name"
    t.string "step_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "avatar_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
