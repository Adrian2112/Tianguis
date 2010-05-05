class AddAttachmentsImagenToArticulo < ActiveRecord::Migration
  def self.up
    add_column :articulos, :imagenUno_file_name, :string
    add_column :articulos, :imagenUno_content_type, :string
    add_column :articulos, :imagenUno_file_size, :integer
    add_column :articulos, :imagenUno_updated_at, :datetime

		add_column :articulos, :imagenDos_file_name, :string
    add_column :articulos, :imagenDos_content_type, :string
    add_column :articulos, :imagenDos_file_size, :integer
    add_column :articulos, :imagenDos_updated_at, :datetime

		add_column :articulos, :imagenTres_file_name, :string
    add_column :articulos, :imagenTres_content_type, :string
    add_column :articulos, :imagenTres_file_size, :integer
    add_column :articulos, :imagenTres_updated_at, :datetime

		add_column :articulos, :imagenCuatro_file_name, :string
    add_column :articulos, :imagenCuatro_content_type, :string
    add_column :articulos, :imagenCuatro_file_size, :integer
    add_column :articulos, :imagenCuatro_updated_at, :datetime
  end

  def self.down
    remove_column :articulos, :imagenUno_file_name
    remove_column :articulos, :imagenUno_content_type
    remove_column :articulos, :imagenUno_file_size
    remove_column :articulos, :imagenUno_updated_at

		remove_column :articulos, :imagenDos_file_name
    remove_column :articulos, :imagenDos_content_type
    remove_column :articulos, :imagenDos_file_size
    remove_column :articulos, :imagenDos_updated_at

		remove_column :articulos, :imagenTres_file_name
    remove_column :articulos, :imagenTres_content_type
    remove_column :articulos, :imagenTres_file_size
    remove_column :articulos, :imagenTres_updated_at

		remove_column :articulos, :imagenCuatro_file_name
    remove_column :articulos, :imagenCuatro_content_type
    remove_column :articulos, :imagenCuatro_file_size
    remove_column :articulos, :imagenCuatro_updated_at  

	end
end
