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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130719062446) do

  create_table "appeals", :force => true do |t|
    t.integer  "client_file_id"
    t.float    "ask1"
    t.float    "ask2"
    t.float    "ask3"
    t.string   "scanline"
    t.string   "tier"
    t.string   "tiercode"
    t.string   "mailcode"
    t.string   "mailtype"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "campaign_id"
  end

  add_index "appeals", ["client_file_id", "scanline"], :name => "index_appeals_on_client_file_id_and_scanline"
  add_index "appeals", ["client_file_id"], :name => "index_appeals_on_client_file_id"
  add_index "appeals", ["mailcode"], :name => "index_appeals_on_mailcode"
  add_index "appeals", ["mailtype"], :name => "index_appeals_on_mailtype"
  add_index "appeals", ["scanline"], :name => "index_appeals_on_scanline"
  add_index "appeals", ["tier"], :name => "index_appeals_on_tier"
  add_index "appeals", ["tiercode"], :name => "index_appeals_on_tiercode"

  create_table "campaigns", :force => true do |t|
    t.string   "name"
    t.date     "drop_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "client_id"
    t.boolean  "mp_managed"
  end

  add_index "campaigns", ["drop_date"], :name => "index_campaigns_on_drop_date"
  add_index "campaigns", ["name"], :name => "index_campaigns_on_name"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["name"], :name => "index_clients_on_name"

  create_table "donations", :force => true do |t|
    t.integer  "gift_id"
    t.integer  "client_file_id"
    t.date     "gift_date"
    t.string   "channel"
    t.string   "campaign"
    t.string   "scanline"
    t.float    "amount"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "appeal_id"
    t.integer  "client_id"
  end

  add_index "donations", ["amount"], :name => "index_donations_on_amount"
  add_index "donations", ["campaign"], :name => "index_donations_on_campaign"
  add_index "donations", ["channel"], :name => "index_donations_on_channel"
  add_index "donations", ["client_file_id", "gift_date"], :name => "index_donations_on_client_file_id_and_gift_date"
  add_index "donations", ["client_file_id", "scanline"], :name => "index_donations_on_client_file_id_and_scanline"
  add_index "donations", ["client_file_id"], :name => "index_donations_on_client_file_id"
  add_index "donations", ["gift_date"], :name => "index_donations_on_gift_date"
  add_index "donations", ["scanline"], :name => "index_donations_on_scanline"

  create_table "donors", :force => true do |t|
    t.integer  "client_file_id"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "donors", ["client_file_id"], :name => "index_donors_on_client_file_id"
  add_index "donors", ["name"], :name => "index_donors_on_name"

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
