# == Schema Information
# Schema version: 20100403213328
#
# Table name: articulos
#
#  id            :integer(4)      not null, primary key
#  nombre        :string(255)
#  precio        :integer(10)
#  imagen_uno    :string(255)
#  imagen_dos    :string(255)
#  imagen_tres   :string(255)
#  imagen_cuatro :string(255)
#  cantidad      :integer(4)
#  descripcion   :string(255)
#  status        :integer(4)
#  categoria_id  :integer(4)
#  vendedor_id   :integer(4)
#  comprador_id  :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

class Articulo < ActiveRecord::Base
  belongs_to :vendedor, :class_name => "Usuario", :foreign_key => "vendedor_id"
  belongs_to :comprador, :class_name => "Usuario", :foreign_key => "comprador_id"
  belongs_to :categoria
	has_many :assets, :dependent => :destroy
	accepts_nested_attributes_for :assets
  
  validates_presence_of :nombre, :precio, :cantidad, :descripcion
  validates_numericality_of :precio, :cantidad
end
