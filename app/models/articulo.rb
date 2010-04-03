class Articulo < ActiveRecord::Base
  belongs_to :vendedor, :class_name => "Usuario", :foreign_key => "vendedor_id"
  belongs_to :comprador, :class_name => "Usuario", :foreign_key => "comprador_id"
  belongs_to :categoria
  
  validates_presence_of :nombre, :precio, :cantidad, :descripcion
  validates_numericality_of :precio, :cantidad
end