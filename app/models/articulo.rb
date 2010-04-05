class Articulo < ActiveRecord::Base
  belongs_to :vendedor, :class_name => "Usuario", :foreign_key => "vendedor_id"
  belongs_to :comprador, :class_name => "Usuario", :foreign_key => "comprador_id"
  belongs_to :categoria
  
  validates_presence_of :nombre, :precio, :cantidad, :descripcion, :descripcion_corta
  validates_length_of :descripcion_corta, :maximum => 70
  validates_numericality_of :precio, :cantidad
end