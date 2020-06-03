# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_02_162451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "club_tournaments", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_tournaments_on_club_id"
    t.index ["tournament_id"], name: "index_club_tournaments_on_tournament_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_clubs_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.date "birth"
    t.string "citizenship"
    t.integer "height"
    t.bigint "user_id", null: false
    t.bigint "club_id"
    t.float "longitude"
    t.float "latitude"
    t.string "position"
    t.string "skill"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "address"
    t.integer "salary"
    t.index ["club_id"], name: "index_players_on_club_id"
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "game_qty"
    t.integer "goal_qty"
    t.integer "starting_eleven_avg"
    t.bigint "player_id", null: false
    t.bigint "tournament_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_statistics_on_player_id"
    t.index ["tournament_id"], name: "index_statistics_on_tournament_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "state"
    t.string "season_year"
    t.string "tournament_type"
    t.string "league"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "club_tournaments", "clubs"
  add_foreign_key "club_tournaments", "tournaments"
  add_foreign_key "clubs", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "players", "clubs"
  add_foreign_key "players", "users"
  add_foreign_key "statistics", "players"
  add_foreign_key "statistics", "tournaments"
end
