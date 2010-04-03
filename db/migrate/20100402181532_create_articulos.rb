class CreateArticulos < ActiveRecord::Migration
  def self.up
    create_table :articulos do |t|
      t.string :nombre
      t.decimal :precio
      t.string :imagen_uno
      t.string :imagen_dos
      t.string :imagen_tres
      t.string :imagen_cuatro
      t.integer :cantidad
      t.string :descripcion
      t.integer :status, :default => 0 
      t.integer :categoria_id
      t.integer :vendedor_id
      t.integer :comprador_id

      t.timestamps
    end
  end

  def self.down
    drop_table :articulos
  end
end
