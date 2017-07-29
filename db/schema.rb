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

ActiveRecord::Schema.define(version: 20170723181350) do

  create_table "answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["user_id"], name: "index_answers_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "content"
  end

  add_index "comments", ["answer_id"], name: "index_comments_on_answer_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "downvoteas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "downvoteas", ["answer_id"], name: "index_downvoteas_on_answer_id"
  add_index "downvoteas", ["user_id"], name: "index_downvoteas_on_user_id"

  create_table "downvotecs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "downvotecs", ["comment_id"], name: "index_downvotecs_on_comment_id"
  add_index "downvotecs", ["user_id"], name: "index_downvotecs_on_user_id"

  create_table "downvoteqs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "downvoteqs", ["question_id"], name: "index_downvoteqs_on_question_id"
  add_index "downvoteqs", ["user_id"], name: "index_downvoteqs_on_user_id"

  create_table "downvoters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "downvoters", ["reply_id"], name: "index_downvoters_on_reply_id"
  add_index "downvoters", ["user_id"], name: "index_downvoters_on_user_id"

  create_table "follow_mappings", force: :cascade do |t|
    t.integer  "followee_id"
    t.integer  "follower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "anonymous",  default: false
  end

  add_index "questions", ["user_id"], name: "index_questions_on_user_id"

  create_table "replies", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "replies", ["comment_id"], name: "index_replies_on_comment_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "upvoteas", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvoteas", ["answer_id"], name: "index_upvoteas_on_answer_id"
  add_index "upvoteas", ["user_id"], name: "index_upvoteas_on_user_id"

  create_table "upvotecs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "comment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvotecs", ["comment_id"], name: "index_upvotecs_on_comment_id"
  add_index "upvotecs", ["user_id"], name: "index_upvotecs_on_user_id"

  create_table "upvoteqs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "upvoteqs", ["question_id"], name: "index_upvoteqs_on_question_id"
  add_index "upvoteqs", ["user_id"], name: "index_upvoteqs_on_user_id"

  create_table "upvoters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "reply_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "upvoters", ["reply_id"], name: "index_upvoters_on_reply_id"
  add_index "upvoters", ["user_id"], name: "index_upvoters_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstName"
    t.string   "lastName"
    t.string   "profile_picture"
    t.integer  "post",                   default: 1
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
