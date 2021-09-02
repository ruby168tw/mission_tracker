# README

# table schema
create_table "missions", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "piority"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_missions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.string "password"
    t.string "identity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

* ...
