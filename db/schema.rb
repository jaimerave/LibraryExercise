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

ActiveRecord::Schema.define(version: 20170526040024) do

  create_table "borrowed_copies", force: :cascade do |t|
    t.integer "item_copy_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_copy_id"], name: "index_borrowed_copies_on_item_copy_id"
    t.index ["user_id"], name: "index_borrowed_copies_on_user_id"
  end

  create_table "borrowed_items", force: :cascade do |t|
    t.integer "item_id"
    t.integer "user_id"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_borrowed_items_on_item_id"
    t.index ["user_id"], name: "index_borrowed_items_on_user_id"
  end

  create_table "item_copies", force: :cascade do |t|
    t.integer "item_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_copies_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "title"
    t.integer "length"
    t.integer "copies"
    t.string "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
