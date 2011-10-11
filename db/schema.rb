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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20111003121535) do
=======
ActiveRecord::Schema.define(:version => 20111006053520) do
>>>>>>> multiform
=======
ActiveRecord::Schema.define(:version => 20111006053520) do
>>>>>>> estimator

  create_table "brands", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
  end

  create_table "car_models", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "car_models", ["brand_id"], :name => "index_car_models_on_brand_id"

  create_table "cars", :force => true do |t|
    t.string   "name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cars", ["brand_id"], :name => "index_cars_on_brand_id"

  create_table "labors", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "maintenance_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maintenances", :force => true do |t|
    t.string   "description"
    t.integer  "price"
    t.integer  "production_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mileage"
  end

  add_index "maintenances", ["production_year_id"], :name => "index_maintenances_on_production_year_id"

  create_table "maintenances_parts", :id => false, :force => true do |t|
    t.integer "maintenance_id"
    t.integer "part_id"
  end

  create_table "parts", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "production_years", :force => true do |t|
    t.integer  "year"
    t.integer  "car_model_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "production_years", ["car_model_id"], :name => "index_production_years_on_car_model_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "role_id"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
