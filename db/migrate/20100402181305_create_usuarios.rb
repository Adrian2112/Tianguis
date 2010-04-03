class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :sexo
      t.string :nickname
      t.string :hashed_password
      t.string :salt
      t.string :telefono
      t.date :fecha_nacimiento
      t.string :email
      t.string :carrera
      t.decimal :reputacion

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
