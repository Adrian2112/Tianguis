class Articulo < ActiveRecord::Base
  belongs_to :usuario, :foreign_key => "vendedor_id"
  belongs_to :usuario, :foreign_key => "comprador_id"
  belongs_to :categoria
  
  validates_presence_of :nombre, :precio, :cantidad, :descripcion
  validates_numericality_of :precio, :cantidad
end