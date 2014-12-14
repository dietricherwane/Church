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

ActiveRecord::Schema.define(version: 20141212180627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allocations", force: true do |t|
    t.string   "firstname",            limit: 150
    t.string   "lastname",             limit: 150
    t.date     "from"
    t.date     "to"
    t.string   "provenance_ministry",  limit: 150
    t.string   "destination_ministry", limit: 150
    t.string   "role",                 limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "arrivals", force: true do |t|
    t.string   "firstname",                limit: 150
    t.string   "lastname",                 limit: 150
    t.date     "from"
    t.string   "recommandation_letter_id", limit: 20
    t.string   "origin_chuch",             limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baptisms", force: true do |t|
    t.date     "baptism_date"
    t.string   "place",                     limit: 150
    t.string   "ministry",                  limit: 150
    t.integer  "baptist_responsibility_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status_id"
  end

  create_table "baptist_responsibilities", force: true do |t|
    t.string   "name",       limit: 150
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "basic_courses", force: true do |t|
    t.boolean  "status"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "births", force: true do |t|
    t.string   "firstname",         limit: 150
    t.string   "lastname",          limit: 150
    t.string   "father_firstname",  limit: 150
    t.string   "father_lastname",   limit: 150
    t.string   "mother_firstname",  limit: 150
    t.string   "mother_lastname",   limit: 150
    t.string   "birth_registry_id", limit: 50
    t.date     "birthdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demises", force: true do |t|
    t.string   "firstname",              limit: 150
    t.string   "lastname",               limit: 150
    t.text     "description"
    t.date     "from"
    t.integer  "number_of_children"
    t.string   "wife_husband_firstname", limit: 150
    t.string   "wife_husband_lastname",  limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departures", force: true do |t|
    t.string   "firstname",                limit: 150
    t.string   "lastname",                 limit: 150
    t.date     "from"
    t.date     "to"
    t.text     "reason"
    t.string   "recommandation_letter_id", limit: 20
    t.string   "destination_chuch",        limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devoteds", force: true do |t|
    t.string   "firstname",            limit: 150
    t.string   "lastname",             limit: 150
    t.string   "phone_number",         limit: 16
    t.string   "mobile_number",        limit: 16
    t.date     "birthdate"
    t.string   "birthplace",           limit: 150
    t.string   "address",              limit: 150
    t.integer  "tribe_id"
    t.string   "identity_card_number"
    t.integer  "status_id"
    t.integer  "marital_status_id"
    t.integer  "social_status_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.string   "company_name",         limit: 150
    t.string   "company_phone_number", limit: 16
    t.string   "job",                  limit: 150
    t.integer  "social_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marital_status_lists", force: true do |t|
    t.string   "name",       limit: 150
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marital_statuses", force: true do |t|
    t.integer  "marital_status_list_id"
    t.integer  "devoted_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marrieds", force: true do |t|
    t.integer  "marital_status_id"
    t.string   "spouse_firstname",             limit: 150
    t.string   "spouse_lastname",              limit: 150
    t.date     "spouse_birthdate"
    t.string   "spouse_birth_registry_number", limit: 50
    t.integer  "number_of_children"
    t.integer  "tribe_id"
    t.string   "wedding_ministry",             limit: 150
    t.string   "wedding_church",               limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offering_types", force: true do |t|
    t.string   "name",       limit: 150
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offerings", force: true do |t|
    t.string   "firstname",        limit: 150
    t.string   "lastname",         limit: 150
    t.integer  "amount"
    t.date     "offering_date"
    t.integer  "offering_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "penalizations", force: true do |t|
    t.string   "firstname",   limit: 150
    t.string   "lastname",    limit: 150
    t.text     "description"
    t.text     "reason"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_status_lists", force: true do |t|
    t.string   "name",       limit: 150
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "social_statuses", force: true do |t|
    t.integer  "devoted_id"
    t.integer  "social_status_list_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "status_lists", force: true do |t|
    t.string   "name",       limit: 150
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "name",           limit: 150
    t.integer  "devoted_id"
    t.integer  "status_list_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.string   "class_branch",        limit: 150
    t.string   "school",              limit: 150
    t.string   "school_phone_number", limit: 150
    t.integer  "social_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tribes", force: true do |t|
    t.string   "name",       limit: 150
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "weddings", force: true do |t|
    t.string   "husband_firstname", limit: 150
    t.string   "husband_lastname",  limit: 150
    t.string   "wife_firstname",    limit: 150
    t.string   "wife_lastname",     limit: 150
    t.date     "wedding_date"
    t.string   "church",            limit: 150
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
