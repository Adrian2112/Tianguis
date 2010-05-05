module ApplicationHelper

  def error(objeto, nombre)
    if objeto.errors[nombre].is_a? Array
      objeto.errors[nombre].first.capitalize
    elsif objeto.errors[nombre] != nil
      objeto.errors[nombre].capitalize
    end
  end

def title
    titulo_base = "El Tianguis - Llevele, Llevele"
    if @title.nil?
      titulo_base
    else
      "#{titulo_base} | #{@title}"
    end
  end
  
end
