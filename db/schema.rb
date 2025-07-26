# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_07_26_124118) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "side", null: false
    t.decimal "price", precision: 20, scale: 8, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "channel_links", force: :cascade do |t|
    t.bigint "alert_id", null: false
    t.string "channel_type", null: false
    t.bigint "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_id", "channel_type", "channel_id"], name: "idx_on_alert_id_channel_type_channel_id_1e6308be33", unique: true
    t.index ["alert_id"], name: "index_channel_links_on_alert_id"
    t.index ["channel_type", "channel_id"], name: "index_channel_links_on_channel"
  end

  create_table "email_channels", force: :cascade do |t|
    t.boolean "enabled", default: false
    t.string "email_address", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "channel_links", "alerts"
end
