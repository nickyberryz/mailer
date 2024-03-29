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

ActiveRecord::Schema.define(:version => 20130323194315) do

  create_table "detail_rooms", :force => true do |t|
    t.string   "roomname",   :null => false
    t.integer  "amount"
    t.string   "room_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "forms", :force => true do |t|
    t.string   "position"
    t.string   "name"
    t.string   "surname"
    t.string   "institution"
    t.string   "tel"
    t.string   "email"
    t.string   "roomtype"
    t.string   "roomname"
    t.date     "date_to_reserve"
    t.string   "start_time"
    t.string   "finish_time"
    t.string   "because"
    t.string   "subject"
    t.integer  "amount_of_people"
    t.string   "require_tool"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "reserves", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "roomname"
    t.date     "date_to_reserve"
    t.string   "start_time"
    t.string   "finish_time"
    t.string   "tel"
    t.string   "email"
    t.string   "status"
  end

  create_table "rooms", :force => true do |t|
    t.string   "roomname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "first"
    t.string   "second"
    t.string   "third"
    t.string   "fourth"
    t.string   "fifth"
    t.string   "sixth"
    t.string   "seventh"
    t.string   "eighth"
    t.string   "day"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "staffs", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "firstname"
    t.string   "lastname"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tools", :force => true do |t|
    t.string   "roomname",           :default => "0"
    t.integer  "amplifier",          :default => 0
    t.integer  "microphone",         :default => 0
    t.integer  "computer",           :default => 0
    t.integer  "overhead_projector", :default => 0
    t.integer  "lcd_projector",      :default => 0
    t.integer  "television",         :default => 0
    t.integer  "voice_recorder",     :default => 0
    t.integer  "video_recorder",     :default => 0
    t.integer  "visualizer",         :default => 0
    t.integer  "loudspeaker",        :default => 0
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "welcomes", :force => true do |t|
    t.boolean  "choose"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "img_file_name"
    t.string   "img_content_type"
    t.integer  "img_file_size"
    t.datetime "img_updated_at"
  end

end
