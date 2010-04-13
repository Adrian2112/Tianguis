class Categoria < ActiveRecord::Base
  belongs_to :articulo
  
  CATEGORIAS = [
    # Displayed         stored in db
    [ "Ropa" , "ropa" ],
    [ "Electrodomesticos" , "electrodomesticos" ],
    [ "Animales" , "animales" ]
  ]
end
