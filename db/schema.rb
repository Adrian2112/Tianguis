# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100402184415) do

  create_table "amigos", :force => true do |t|
    t.integer  "amigo_uno_id", :null => false
    t.integer  "amigo_dos_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articulos", :force => true do |t|
    t.string   "nombre"
    t.integer  "precio",            :limit => 10, :precision => 10, :scale => 0
    t.string   "imagen_uno"
    t.string   "imagen_dos"
    t.string   "imagen_tres"
    t.string   "imagen_cuatro"
    t.integer  "cantidad"
    t.string   "descripcion_corta"
    t.string   "descripcion"
    t.integer  "status",                                                         :default => 0
    t.integer  "vendedor_id"
    t.integer  "comprador_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
    t.integer  "articulo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nombre"
    t.string   "apellido_paterno"
    t.string   "apellido_materno"
    t.string   "sexo"
    t.string   "nickname"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "telefono"
    t.date     "fecha_nacimiento"
    t.string   "email"
    t.string   "carrera"
    t.integer  "reputacion",       :limit => 10, :precision => 10, :scale => 0, :default => 0
    t.integer  "votos",                                                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
