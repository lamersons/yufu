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

ActiveRecord::Schema.define(version: 20141201120501) do

  create_table "virtual_aliases", force: true do |t|
    t.string  "source"
    t.string  "destination"
    t.integer "domain_id"
  end

  add_index "virtual_aliases", ["domain_id"], name: "index_virtual_aliases_on_domain_id", using: :btree

  create_table "virtual_domains", force: true do |t|
    t.string "name"
  end

  create_table "virtual_users", force: true do |t|
    t.string  "email"
    t.string  "password"
    t.integer "domain_id"
  end

  add_index "virtual_users", ["domain_id"], name: "index_virtual_users_on_domain_id", using: :btree

end
