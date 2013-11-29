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

ActiveRecord::Schema.define(version: 20131129031543) do

  create_table "archivos", force: true do |t|
    t.string   "nombre"
    t.integer  "color_r"
    t.integer  "color_g"
    t.integer  "color_b"
    t.integer  "num_lados"
    t.integer  "size_lados"
    t.string   "tecla_tx",   limit: 1, default: "r"
    t.string   "tecla_ty",   limit: 1, default: "t"
    t.string   "tecla_tz",   limit: 1, default: "y"
    t.string   "tecla_sx",   limit: 1, default: "g"
    t.string   "tecla_sy",   limit: 1, default: "h"
    t.string   "tecla_sz",   limit: 1, default: "b"
    t.string   "tecla_rx",   limit: 1, default: "b"
    t.string   "tecla_ry",   limit: 1, default: "n"
    t.string   "tecla_rz",   limit: 1, default: "m"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
