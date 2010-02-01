# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100201093606) do

  create_table "answers", :force => true do |t|
    t.integer "question_id"
    t.string  "answer"
    t.boolean "rt"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"

  create_table "blogs", :force => true do |t|
    t.string   "name"
    t.text     "perex"
    t.text     "content"
    t.boolean  "visible",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "id_kraj"
    t.decimal  "lat",                       :precision => 15, :scale => 10
    t.decimal  "lng",                       :precision => 15, :scale => 10
    t.string   "name"
    t.string   "street1"
    t.string   "street2"
    t.string   "town"
    t.string   "zip_code"
    t.string   "email1"
    t.string   "email2"
    t.string   "www1"
    t.string   "www2"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax1"
    t.string   "fax2"
    t.string   "ico"
    t.string   "dic"
    t.string   "kraj",       :limit => 100
    t.string   "kraj_kod",   :limit => 10
    t.text     "anotation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employers", ["id_kraj"], :name => "employers_id_kraj_index"
  add_index "employers", ["kraj_kod"], :name => "employers_kraj_kod_index"
  add_index "employers", ["user_id"], :name => "employers_user_id_index"

  create_table "hints", :force => true do |t|
    t.string   "name"
    t.text     "perex"
    t.text     "content"
    t.boolean  "visible",    :default => false
    t.boolean  "hint_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.text     "perex"
    t.text     "content"
    t.boolean  "visible",    :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_doors", :force => true do |t|
    t.integer "school_id"
    t.string  "description"
    t.date    "date_from"
    t.date    "date_till"
  end

  add_index "open_doors", ["date_from"], :name => "open_doors_date_from_index"
  add_index "open_doors", ["date_till"], :name => "open_doors_date_till_index"
  add_index "open_doors", ["school_id"], :name => "open_doors_school_id_index"

  create_table "photos", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "title"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  add_index "photos", ["attachable_id", "attachable_type"], :name => "index_photos_on_attachable_id_and_attachable_type"

  create_table "questions", :force => true do |t|
    t.integer "round_id"
    t.string  "question"
  end

  add_index "questions", ["round_id"], :name => "index_questions_on_round_id"

  create_table "rounds", :force => true do |t|
    t.date "date_from"
    t.date "date_till"
  end

  create_table "schools", :force => true do |t|
    t.integer  "user_id"
    t.decimal  "lat",                       :precision => 15, :scale => 10
    t.decimal  "lng",                       :precision => 15, :scale => 10
    t.string   "name"
    t.string   "street"
    t.string   "town"
    t.string   "zip_code"
    t.string   "email1"
    t.string   "email2"
    t.string   "www"
    t.string   "phone"
    t.string   "fax"
    t.text     "anotation"
    t.string   "okres_kod",  :limit => 10
    t.string   "okres",      :limit => 100
    t.string   "kraj_kod",   :limit => 10
    t.string   "kraj",       :limit => 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "schools", ["kraj_kod"], :name => "sections_kraj_kod_index"
  add_index "schools", ["okres_kod"], :name => "schools_okres_kod_index"
  add_index "schools", ["user_id"], :name => "schools_user_id_index"

  create_table "schools_sections", :id => false, :force => true do |t|
    t.integer "school_id"
    t.integer "section_id"
  end

  add_index "schools_sections", ["school_id"], :name => "index_schools_sections_on_school_id"
  add_index "schools_sections", ["section_id"], :name => "index_schools_sections_on_section_id"

  create_table "sections", :force => true do |t|
    t.string   "name"
    t.string   "course"
    t.integer  "visits"
    t.text     "exercise"
    t.boolean  "graduation",  :default => false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "user_answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_answers", ["answer_id"], :name => "user_answers_answer_id_index"
  add_index "user_answers", ["user_id"], :name => "user_answers_user_id_index"

  create_table "user_rounds", :force => true do |t|
    t.integer  "user_id"
    t.integer  "round_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "answer_ok"
  end

  add_index "user_rounds", ["round_id"], :name => "user_rounds_round_id_index"
  add_index "user_rounds", ["user_id"], :name => "user_rounds_user_id_index"

  create_table "users", :force => true do |t|
    t.string   "user_name",           :default => "",    :null => false
    t.string   "email",                                  :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token", :default => "",    :null => false
    t.string   "perishable_token",    :default => "",    :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",              :default => false, :null => false
    t.string   "street"
    t.string   "city"
    t.string   "psc"
    t.string   "birth"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["last_request_at"], :name => "index_users_on_last_request_at"
  add_index "users", ["perishable_token"], :name => "index_users_on_perishable_token"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"

end
