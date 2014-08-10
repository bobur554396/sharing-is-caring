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

ActiveRecord::Schema.define(version: 20140810040040) do

  create_table "attachments", force: true do |t|
    t.string "token"
  end

  create_table "attachment_files", force: true do |t|
    t.string   "document"
    t.integer  "attachment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_token"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.index ["attachment_id"], :name => "fk__attachment_files_attachment_id"
    t.foreign_key ["attachment_id"], "attachments", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_attachment_files_attachment_id"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "image_url"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_admin"
    t.index ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["is_admin"], :name => "index_users_on_is_admin"
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
    t.index ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true
  end

  create_table "authentications", force: true do |t|
    t.integer  "user_id"
    t.string   "provider",      null: false
    t.string   "proid",         null: false
    t.string   "token"
    t.string   "refresh_token"
    t.string   "secret"
    t.datetime "expires_at"
    t.string   "username"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["provider"], :name => "index_authentications_on_provider"
    t.index ["user_id"], :name => "fk__authentications_user_id"
    t.index ["user_id"], :name => "k__authentications_user_id"
    t.foreign_key ["user_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_authentications_user_id"
  end

  create_table "links", force: true do |t|
  end

  create_table "oauth_caches", id: false, force: true do |t|
    t.integer  "authentication_id", null: false
    t.text     "data_json",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["authentication_id"], :name => "index_oauth_caches_on_authentication_id", :unique => true
    t.foreign_key ["authentication_id"], "authentications", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_oauth_caches_authentication_id"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["item", "table", "month", "year"], :name => "index_rails_admin_histories"
  end

  create_table "shares", force: true do |t|
    t.integer  "author_id"
    t.string   "title"
    t.string   "content"
    t.integer  "actable_id"
    t.string   "actable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["actable_id"], :name => "fk__shares_actable_id"
    t.index ["author_id"], :name => "fk__shares_author_id"
    t.index ["created_at"], :name => "index_shares_on_created_at"
    t.foreign_key ["actable_id"], "actables", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_shares_actable_id"
    t.foreign_key ["author_id"], "authors", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_shares_author_id"
  end

  create_table "simple_hashtag_hashtaggings", force: true do |t|
    t.integer "hashtag_id"
    t.integer "hashtaggable_id"
    t.string  "hashtaggable_type"
    t.index ["hashtag_id"], :name => "index_simple_hashtag_hashtaggings_on_hashtag_id"
    t.index ["hashtaggable_id", "hashtaggable_type"], :name => "index_hashtaggings_hashtaggable_id_hashtaggable_type"
    t.foreign_key ["hashtag_id"], "hashtags", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_simple_hashtag_hashtaggings_hashtag_id"
  end

  create_table "simple_hashtag_hashtags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name"], :name => "index_simple_hashtag_hashtags_on_name"
  end

end
