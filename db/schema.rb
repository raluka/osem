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

ActiveRecord::Schema.define(version: 20151005161518) do

  create_table "ahoy_events", force: :cascade do |t|
    t.uuid     "visit_id",   limit: 16
    t.integer  "user_id"
    t.string   "name",       limit: 255
    t.text     "properties"
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time"
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id"
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id"

  create_table "answers", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "call_for_papers", force: :cascade do |t|
    t.date     "start_date",                       null: false
    t.date     "end_date",                         null: false
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "schedule_changes", default: false
    t.integer  "rating",           default: 3
    t.boolean  "schedule_public"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer  "conference_id"
    t.string   "name",          limit: 255
    t.string   "utm_source",    limit: 255
    t.string   "utm_medium",    limit: 255
    t.string   "utm_term",      limit: 255
    t.string   "utm_content",   limit: 255
    t.string   "utm_campaign",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50,  default: ""
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type", limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subject",          limit: 255
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "commercials", force: :cascade do |t|
    t.string   "commercial_id",       limit: 255
    t.string   "commercial_type",     limit: 255
    t.integer  "commercialable_id"
    t.string   "commercialable_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "conferences", force: :cascade do |t|
    t.string   "guid",                  limit: 255,                 null: false
    t.string   "title",                 limit: 255,                 null: false
    t.string   "short_title",           limit: 255,                 null: false
    t.string   "timezone",              limit: 255,                 null: false
    t.string   "html_export_path",      limit: 255
    t.date     "start_date",                                        null: false
    t.date     "end_date",                                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name",        limit: 255
    t.string   "logo_content_type",     limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "use_dietary_choices",               default: false
    t.integer  "revision"
    t.boolean  "use_vpositions",                    default: false
    t.boolean  "use_vdays",                         default: false
    t.boolean  "use_difficulty_levels",             default: false
    t.boolean  "use_volunteers"
    t.string   "color",                 limit: 255
    t.text     "events_per_week"
    t.text     "description"
  end

  create_table "conferences_questions", id: false, force: :cascade do |t|
    t.integer "conference_id"
    t.integer "question_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "social_tag",    limit: 255
    t.string   "email",         limit: 255
    t.string   "facebook",      limit: 255
    t.string   "googleplus",    limit: 255
    t.string   "twitter",       limit: 255
    t.string   "instagram",     limit: 255
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sponsor_email", limit: 255
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",               default: 0, null: false
    t.integer  "attempts",               default: 0, null: false
    t.text     "handler",                            null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.string   "queue",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "dietary_choices", force: :cascade do |t|
    t.integer  "conference_id"
    t.string   "title",         limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "difficulty_levels", force: :cascade do |t|
    t.integer  "conference_id"
    t.string   "title",         limit: 255
    t.text     "description"
    t.string   "color",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "email_settings", force: :cascade do |t|
    t.integer  "conference_id"
    t.boolean  "send_on_registration",                                      default: false
    t.boolean  "send_on_accepted",                                          default: false
    t.boolean  "send_on_rejected",                                          default: false
    t.boolean  "send_on_confirmed_without_registration",                    default: false
    t.text     "registration_body"
    t.text     "accepted_body"
    t.text     "rejected_body"
    t.text     "confirmed_without_registration_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "registration_subject",                          limit: 255
    t.string   "accepted_subject",                              limit: 255
    t.string   "rejected_subject",                              limit: 255
    t.string   "confirmed_without_registration_subject",        limit: 255
    t.boolean  "send_on_conference_dates_updated",                          default: false
    t.string   "conference_dates_updated_subject",              limit: 255
    t.text     "conference_dates_updated_body"
    t.boolean  "send_on_conference_registration_dates_updated",             default: false
    t.string   "conference_registration_dates_updated_subject", limit: 255
    t.text     "conference_registration_dates_updated_body"
    t.boolean  "send_on_venue_updated",                                     default: false
    t.string   "venue_updated_subject",                         limit: 255
    t.text     "venue_updated_body"
    t.boolean  "send_on_call_for_papers_dates_updated",                     default: false
    t.boolean  "send_on_call_for_papers_schedule_public",                   default: false
    t.string   "call_for_papers_schedule_public_subject",       limit: 255
    t.string   "call_for_papers_dates_updated_subject",         limit: 255
    t.text     "call_for_papers_schedule_public_body"
    t.text     "call_for_papers_dates_updated_body"
  end

  create_table "event_types", force: :cascade do |t|
    t.integer "conference_id"
    t.string  "title",                   limit: 255,               null: false
    t.integer "length",                              default: 30
    t.integer "minimum_abstract_length",             default: 0
    t.integer "maximum_abstract_length",             default: 500
    t.string  "color",                   limit: 255
    t.string  "description",             limit: 255
  end

  create_table "event_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "event_role", limit: 255, default: "participant", null: false
    t.string   "comment",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "guid",                         limit: 255,                 null: false
    t.integer  "conference_id"
    t.integer  "event_type_id"
    t.string   "title",                        limit: 255,                 null: false
    t.string   "subtitle",                     limit: 255
    t.integer  "time_slots"
    t.string   "state",                        limit: 255, default: "new", null: false
    t.string   "progress",                     limit: 255, default: "new", null: false
    t.string   "language",                     limit: 255
    t.datetime "start_time"
    t.text     "abstract"
    t.text     "description"
    t.boolean  "public",                                   default: true
    t.string   "logo_file_name",               limit: 255
    t.string   "logo_content_type",            limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "proposal_additional_speakers"
    t.integer  "track_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "require_registration"
    t.integer  "difficulty_level_id"
    t.integer  "week"
    t.boolean  "is_highlight",                             default: false
  end

  create_table "events_registrations", id: false, force: :cascade do |t|
    t.integer "registration_id"
    t.integer "event_id"
  end

  create_table "lodgings", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website_link",       limit: 255
    t.integer  "conference_id"
  end

  create_table "openids", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "email",      limit: 255
    t.string   "uid",        limit: 255
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.text     "description"
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qanswers", force: :cascade do |t|
    t.integer  "question_id"
    t.integer  "answer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qanswers_registrations", id: false, force: :cascade do |t|
    t.integer "registration_id", null: false
    t.integer "qanswer_id",      null: false
  end

  create_table "question_types", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.integer  "question_type_id"
    t.integer  "conference_id"
    t.boolean  "global"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_periods", force: :cascade do |t|
    t.integer  "conference_id"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "conference_id"
    t.datetime "arrival"
    t.datetime "departure"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dietary_choice_id"
    t.text     "other_dietary_choice"
    t.text     "other_special_needs"
    t.boolean  "attended",             default: false
    t.boolean  "volunteer"
    t.integer  "user_id"
    t.integer  "week"
  end

  create_table "registrations_social_events", id: false, force: :cascade do |t|
    t.integer "registration_id"
    t.integer "social_event_id"
  end

  create_table "registrations_vchoices", id: false, force: :cascade do |t|
    t.integer "registration_id"
    t.integer "vchoice_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",   limit: 255
    t.integer  "resource_id"
    t.string   "resource_type", limit: 255
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id"

  create_table "rooms", force: :cascade do |t|
    t.string  "guid",          limit: 255, null: false
    t.integer "conference_id"
    t.string  "name",          limit: 255, null: false
    t.integer "size"
  end

  create_table "social_events", force: :cascade do |t|
    t.integer "conference_id"
    t.string  "title",         limit: 255
    t.text    "description"
    t.date    "date"
  end

  create_table "splashpages", force: :cascade do |t|
    t.integer  "conference_id"
    t.boolean  "public"
    t.boolean  "include_tracks"
    t.boolean  "include_program"
    t.boolean  "include_social_media"
    t.boolean  "include_venue"
    t.boolean  "include_tickets"
    t.boolean  "include_registrations"
    t.boolean  "include_sponsors"
    t.boolean  "include_lodgings"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "include_cfp",           default: false
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.text     "description"
    t.string   "website_url",          limit: 255
    t.string   "logo_file_name",       limit: 255
    t.string   "logo_content_type",    limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "sponsorship_level_id"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsorship_levels", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "conference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targets", force: :cascade do |t|
    t.integer  "conference_id"
    t.integer  "campaign_id"
    t.date     "due_date"
    t.integer  "target_count"
    t.string   "unit",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ticket_purchases", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "conference_id"
    t.boolean  "paid",          default: false
    t.datetime "created_at"
    t.integer  "quantity",      default: 1
    t.integer  "user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "conference_id"
    t.string  "title",          limit: 255,                 null: false
    t.text    "description"
    t.integer "price_cents",                default: 0,     null: false
    t.string  "price_currency", limit: 255, default: "USD", null: false
  end

  create_table "tracks", force: :cascade do |t|
    t.string   "guid",          limit: 255, null: false
    t.integer  "conference_id"
    t.string   "name",          limit: 255, null: false
    t.text     "description"
    t.string   "color",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                   limit: 255
    t.boolean  "email_public"
    t.text     "biography"
    t.string   "nickname",               limit: 255
    t.string   "affiliation",            limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "mobile",                 limit: 255
    t.string   "tshirt",                 limit: 255
    t.string   "languages",              limit: 255
    t.text     "volunteer_experience"
    t.boolean  "is_admin",                           default: false
    t.string   "username",               limit: 255
    t.boolean  "is_disabled",                        default: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "vchoices", force: :cascade do |t|
    t.integer "vday_id"
    t.integer "vposition_id"
  end

  create_table "vdays", force: :cascade do |t|
    t.integer  "conference_id"
    t.date     "day"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "guid",               limit: 255
    t.string   "name",               limit: 255
    t.string   "website",            limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name",    limit: 255
    t.string   "photo_content_type", limit: 255
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "street",             limit: 255
    t.string   "postalcode",         limit: 255
    t.string   "city",               limit: 255
    t.string   "country",            limit: 255
    t.string   "latitude",           limit: 255
    t.string   "longitude",          limit: 255
    t.integer  "conference_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255, null: false
    t.integer  "item_id",                    null: false
    t.string   "event",          limit: 255, null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object"
    t.text     "object_changes"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

  create_table "visits", force: :cascade do |t|
    t.uuid     "visitor_id",       limit: 16
    t.string   "ip",               limit: 255
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "vpositions", force: :cascade do |t|
    t.integer  "conference_id"
    t.string   "title",         limit: 255, null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
