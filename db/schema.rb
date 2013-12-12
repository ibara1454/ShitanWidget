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

ActiveRecord::Schema.define(:version => 20131212150310) do

  create_table "search_missive_accept_dates", :force => true do |t|
    t.date     "date",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "search_missive_accept_dates", ["date"], :name => "index_search_missive_accept_dates_on_date"
  add_index "search_missive_accept_dates", ["id"], :name => "index_search_missive_accept_dates_on_id"

  create_table "search_missive_agencies", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "search_missive_agencies", ["id"], :name => "index_search_missive_agencies_on_id"

  create_table "search_missive_attachments", :force => true do |t|
    t.string   "path",       :null => false
    t.integer  "mime_id",    :null => false
    t.integer  "missive_id", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "search_missive_attachments", ["id"], :name => "index_search_missive_attachments_on_id"
  add_index "search_missive_attachments", ["missive_id"], :name => "index_search_missive_attachments_on_missive_id"

  create_table "search_missive_doc_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "search_missive_documents", :force => true do |t|
    t.string   "path",       :null => false
    t.integer  "mime_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "search_missive_documents", ["id"], :name => "index_search_missive_documents_on_id"

  create_table "search_missive_initials", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "search_missive_initials", ["id"], :name => "index_search_missive_initials_on_id"

  create_table "search_missive_mimes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "search_missive_missives", :force => true do |t|
    t.string   "reference_no",   :null => false
    t.text     "subject",        :null => false
    t.integer  "accept_date_id", :null => false
    t.integer  "doc_type_id",    :null => false
    t.integer  "agency_id",      :null => false
    t.integer  "initial_id",     :null => false
    t.integer  "document_id",    :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "search_missive_missives", ["accept_date_id"], :name => "index_search_missive_missives_on_accept_date_id"
  add_index "search_missive_missives", ["agency_id"], :name => "index_search_missive_missives_on_agency_id"
  add_index "search_missive_missives", ["document_id"], :name => "index_search_missive_missives_on_document_id"
  add_index "search_missive_missives", ["id"], :name => "index_search_missive_missives_on_id"
  add_index "search_missive_missives", ["initial_id"], :name => "index_search_missive_missives_on_initial_id"

end
