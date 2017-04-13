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

ActiveRecord::Schema.define(version: 20170413133100) do

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string "key", limit: 40
    t.string "value", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_simple_captcha_data_on_key"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type001_articles", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type002_articles", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.string "remote_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type003_articles", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "first_name_hiragana", null: false
    t.string "last_name_hiragana", null: false
    t.string "first_postal_code", null: false
    t.string "last_postal_code", null: false
    t.string "prefecture_name", null: false
    t.string "city_address", null: false
    t.string "number_address", null: false
    t.string "house_name"
    t.string "email", null: false
    t.string "first_tel", null: false
    t.string "middle_tel", null: false
    t.string "last_tel", null: false
    t.string "legal_accept_key", null: false
    t.string "subject"
    t.text "body"
    t.string "remote_ip"
    t.string "remote_host"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_type003_articles_on_email", unique: true
  end

  create_table "type004_articles", force: :cascade do |t|
    t.string "media_file"
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type005_articles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type005_files", force: :cascade do |t|
    t.integer "type005_article_id"
    t.string "media_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type005_article_id"], name: "index_type005_files_on_type005_article_id"
  end

  create_table "type006_articles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type006_team_ships", force: :cascade do |t|
    t.integer "type006_article_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_type006_team_ships_on_team_id"
    t.index ["type006_article_id"], name: "index_type006_team_ships_on_type006_article_id"
  end

  create_table "type007_articles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type007_team_ships", force: :cascade do |t|
    t.integer "type007_article_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_type007_team_ships_on_team_id"
    t.index ["type007_article_id"], name: "index_type007_team_ships_on_type007_article_id"
  end

  create_table "type008_articles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type008_team_ships", force: :cascade do |t|
    t.integer "type008_article_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_type008_team_ships_on_team_id"
    t.index ["type008_article_id"], name: "index_type008_team_ships_on_type008_article_id"
  end

  create_table "type009_articles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type009_attachments", force: :cascade do |t|
    t.integer "type009_article_id"
    t.string "media_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type009_article_id"], name: "index_type009_attachments_on_type009_article_id"
  end

  create_table "type010_articles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type010_files", force: :cascade do |t|
    t.integer "type010_article_id", null: false
    t.string "name"
    t.string "media_file", null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_type010_files_on_position"
    t.index ["type010_article_id"], name: "index_type010_files_on_type010_article_id"
  end

  create_table "type011_articles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type011_comments", force: :cascade do |t|
    t.integer "type011_article_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type011_article_id"], name: "index_type011_comments_on_type011_article_id"
  end

  create_table "type012_articles", force: :cascade do |t|
    t.string "comment0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type012_s1_articles", force: :cascade do |t|
    t.integer "type012_article_id", null: false
    t.string "comment1"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type012_article_id"], name: "index_type012_s1_articles_on_type012_article_id"
  end

  create_table "type012_s2_articles", force: :cascade do |t|
    t.integer "type012_s1_article_id", null: false
    t.string "comment2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type012_s1_article_id"], name: "index_type012_s2_articles_on_type012_s1_article_id"
  end

  create_table "type013_articles", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.string "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_type013_articles_on_commentable_type_and_commentable_id"
  end

  create_table "type014_articles", force: :cascade do |t|
    t.datetime "date_v"
    t.datetime "datetime_v"
    t.datetime "datetime_local_v"
    t.datetime "month_v"
    t.datetime "week_v"
    t.datetime "time_v"
    t.integer "range_v"
    t.string "tel_v"
    t.string "url_v"
    t.string "email_v"
    t.string "color_v"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type015_articles", force: :cascade do |t|
    t.string "subject"
    t.text "body"
    t.string "remote_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type016_articles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type016_team_ships", force: :cascade do |t|
    t.integer "type016_article_id", null: false
    t.integer "team_id", null: false
    t.string "relation_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_type016_team_ships_on_team_id"
    t.index ["type016_article_id"], name: "index_type016_team_ships_on_type016_article_id"
  end

  create_table "type017_articles", force: :cascade do |t|
    t.string "map_address"
    t.text "geocode_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type018_email_activations", force: :cascade do |t|
    t.string "email", null: false
    t.string "activate_token", null: false
    t.datetime "expired_at", null: false
    t.datetime "activated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activate_token"], name: "index_type018_email_activations_on_activate_token", unique: true
  end

  create_table "type018_password_reset_url_notifications", force: :cascade do |t|
    t.integer "type018_user_id", null: false
    t.string "email", null: false
    t.string "notice_token", null: false
    t.datetime "expired_at", null: false
    t.datetime "used_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type018_password_reseters", force: :cascade do |t|
    t.integer "type018_user_id", null: false
    t.integer "type018_password_reset_url_notification_id"
    t.string "notice_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type018_user_id"], name: "index_type018_password_reseters_on_type018_user_id"
  end

  create_table "type018_users", force: :cascade do |t|
    t.integer "type018_email_activation_id"
    t.string "handle_name", null: false
    t.string "email", null: false
    t.string "salt", null: false
    t.string "salted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_type018_users_on_email", unique: true
    t.index ["type018_email_activation_id"], name: "index_type018_users_on_type018_email_activation_id"
  end

  create_table "type019_users", force: :cascade do |t|
    t.string "handle_name", null: false
    t.string "email", null: false
    t.string "salt", null: false
    t.string "salted_password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_type019_users_on_email", unique: true
  end

end
