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

ActiveRecord::Schema.define(version: 20150502112023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "transactions", force: :cascade do |t|
    t.decimal  "amount"
    t.string   "description"
    t.datetime "tran_date"
    t.integer  "account_id"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "transactions", ["account_id"], name: "index_transactions_on_account_id", using: :btree

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
  add_foreign_key "transactions", "accounts"
end
