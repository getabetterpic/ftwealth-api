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

ActiveRecord::Schema.define(version: 20150512221308) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "financial_institution_id"
    t.string   "reference"
    t.string   "account_type"
    t.string   "status"
    t.integer  "credential_id"
    t.decimal  "available_balance"
    t.decimal  "posted_balance"
    t.datetime "last_synced_at"
    t.datetime "balance_as_of_date"
    t.string   "description"
    t.string   "bankid"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "accounts", ["credential_id"], name: "index_accounts_on_credential_id", using: :btree
  add_index "accounts", ["financial_institution_id"], name: "index_accounts_on_financial_institution_id", using: :btree
  add_index "accounts", ["user_id"], name: "index_accounts_on_user_id", using: :btree

  create_table "credentials", force: :cascade do |t|
    t.binary   "encrypted_password"
    t.binary   "encrypted_username"
    t.integer  "financial_institution_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "credentials", ["financial_institution_id"], name: "index_credentials_on_financial_institution_id", using: :btree
  add_index "credentials", ["user_id"], name: "index_credentials_on_user_id", using: :btree

  create_table "financial_institutions", force: :cascade do |t|
    t.string   "name"
    t.string   "fid"
    t.string   "org"
    t.string   "url"
    t.date     "last_ofx_validation"
    t.date     "last_ssl_validation"
    t.text     "ofx_template"
    t.string   "sync_type"
    t.string   "sync_class"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "financial_institutions", ["fid"], name: "index_financial_institutions_on_fid", using: :btree
  add_index "financial_institutions", ["name"], name: "index_financial_institutions_on_name", using: :btree

  create_table "ofx_calls", force: :cascade do |t|
    t.text     "original_document"
    t.datetime "requested_date"
    t.decimal  "dtacctup"
    t.string   "trnuid"
    t.decimal  "available_balance"
    t.decimal  "posted_balance"
    t.integer  "account_id"
    t.integer  "financial_institution_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "ofx_calls", ["account_id"], name: "index_ofx_calls_on_account_id", using: :btree
  add_index "ofx_calls", ["financial_institution_id"], name: "index_ofx_calls_on_financial_institution_id", using: :btree

  create_table "ofx_transactions", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "description"
    t.datetime "ofx_date"
    t.integer  "ofx_id"
    t.integer  "scheduled_transaction_id"
    t.integer  "account_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "ofx_call_id"
  end

  add_index "ofx_transactions", ["account_id"], name: "index_ofx_transactions_on_account_id", using: :btree
  add_index "ofx_transactions", ["ofx_call_id"], name: "index_ofx_transactions_on_ofx_call_id", using: :btree
  add_index "ofx_transactions", ["scheduled_transaction_id"], name: "index_ofx_transactions_on_scheduled_transaction_id", using: :btree

  create_table "scheduled_transactions", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "description"
    t.integer  "day_of_month"
    t.hstore   "properties",   default: {"paycheck"=>"false", "recurring"=>"false"}
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "account_id"
  end

  add_index "scheduled_transactions", ["account_id"], name: "index_scheduled_transactions_on_account_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "authentication_token"
  end

  add_foreign_key "accounts", "credentials"
  add_foreign_key "accounts", "financial_institutions"
  add_foreign_key "accounts", "users"
  add_foreign_key "credentials", "financial_institutions"
  add_foreign_key "credentials", "users"
  add_foreign_key "ofx_calls", "accounts"
  add_foreign_key "ofx_calls", "financial_institutions"
  add_foreign_key "ofx_transactions", "accounts"
  add_foreign_key "ofx_transactions", "ofx_calls"
  add_foreign_key "ofx_transactions", "scheduled_transactions"
  add_foreign_key "scheduled_transactions", "accounts"
end
