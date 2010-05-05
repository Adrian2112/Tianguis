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

ActiveRecord::Schema.define(:version => 20100504220623) do

  create_table "amigos", :force => true do |t|
    t.integer  "amigo_uno_id", :null => false
    t.integer  "amigo_dos_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articulos", :force => true do |t|
    t.string   "nombre"
    t.integer  "precio",                    :limit => 10, :precision => 10, :scale => 0
    t.integer  "cantidad"
    t.string   "descripcion_corta"
    t.string   "descripcion"
    t.integer  "status",                                                                 :default => 0
    t.integer  "categoria_id"
    t.integer  "vendedor_id"
    t.integer  "comprador_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagenUno_file_name"
    t.string   "imagenUno_content_type"
    t.integer  "imagenUno_file_size"
    t.datetime "imagenUno_updated_at"
    t.string   "imagenDos_file_name"
    t.string   "imagenDos_content_type"
    t.integer  "imagenDos_file_size"
    t.datetime "imagenDos_updated_at"
    t.string   "imagenTres_file_name"
    t.string   "imagenTres_content_type"
    t.integer  "imagenTres_file_size"
    t.datetime "imagenTres_updated_at"
    t.string   "imagenCuatro_file_name"
    t.string   "imagenCuatro_content_type"
    t.integer  "imagenCuatro_file_size"
    t.datetime "imagenCuatro_updated_at"
  end

  create_table "categorias", :force => true do |t|
    t.string   "nombre"
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
    t.integer  "reputacion",                :limit => 10, :precision => 10, :scale => 0, :default => 0
    t.integer  "votos",                                                                  :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagenPerfil_file_name"
    t.string   "imagenPerfil_content_type"
    t.integer  "imagenPerfil_file_size"
    t.datetime "imagenPerfil_updated_at"
  end

end
