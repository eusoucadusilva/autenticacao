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

ActiveRecord::Schema.define(:version => 20120627040932) do

  create_table "profiles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "hashed_password"
    t.integer  "city_id"
    t.string   "fields"
    t.string   "portifolio_of_oab"
    t.string   "phone"
    t.text     "about"
    t.integer  "teaching"
    t.integer  "professional"
    t.integer  "books_published"
    t.integer  "articles_published"
    t.boolean  "postgraduate"
    t.boolean  "doctorate_in_law"
    t.boolean  "master_of_law"
    t.boolean  "postgraduate_in_law"
    t.boolean  "foreign_laguage"
    t.boolean  "terms_of_use"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
