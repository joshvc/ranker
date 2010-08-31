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

ActiveRecord::Schema.define(:version => 20100831191603) do

  create_table "totaldefenses", :force => true do |t|
    t.string   "team"
    t.decimal  "dgames"
    t.decimal  "dplays"
    t.decimal  "dyards"
    t.decimal  "dyardsperplay"
    t.decimal  "dyardsperplayrr"
    t.decimal  "dtouchdowns"
    t.decimal  "dtouchdownspergame"
    t.decimal  "dtouchdownspergamerr"
    t.decimal  "dyardspergame"
    t.decimal  "dyardspergamerr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "totaloffenses", :force => true do |t|
    t.string   "team"
    t.decimal  "games"
    t.decimal  "yards"
    t.decimal  "plays"
    t.decimal  "yardsperplay"
    t.decimal  "touchdowns"
    t.decimal  "yardspergame"
    t.decimal  "wins"
    t.decimal  "losses"
    t.decimal  "ties"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "winpct"
    t.decimal  "yardspergamerr"
    t.decimal  "yardsperplayrr"
    t.decimal  "touchdownsrr"
    t.decimal  "touchdownspergame"
    t.decimal  "touchdownspergamerr"
  end

end
