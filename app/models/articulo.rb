class Articulo < ActiveRecord::Base

#auto_complete_for :articulo, :nombre

has_attached_file :imagenUno, :styles => { :medium => "200x200>", :thumb => "100x100>" }  
has_attached_file :imagenDos, :styles => { :medium => "200x200>", :thumb => "100x100>" }  
has_attached_file :imagenTres, :styles => { :medium => "200x200>", :thumb => "100x100>" }  
has_attached_file :imagenCuatro, :styles => { :medium => "200x200>", :thumb => "100x100>" }  

belongs_to :vendedor, :class_name => "Usuario", :foreign_key => "vendedor_id"
belongs_to :comprador, :class_name => "Usuario", :foreign_key => "comprador_id"
belongs_to :categoria
  
  validates_presence_of :nombre, :precio, :cantidad, :descripcion, :descripcion_corta
  validates_length_of :descripcion_corta, :maximum => 70
  validates_numericality_of :precio, :cantidad

def self.busqueda(busqueda)
if busqueda
find(:all, :conditions => ['nombre LIKE ?', "%#{busqueda}%"])
end
end

end
