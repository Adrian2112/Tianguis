module UsuariosHelper
  def error(objeto, nombre)
    if objeto.errors[nombre].is_a? Array
      objeto.errors[nombre].first.capitalize
    else
      objeto.errors[nombre].capitalize
    end
  end
end
