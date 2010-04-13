class ArticulosController < ApplicationController
  
  def new
    @usuario = Usuario.find(session[:user_id])
    @articulo = @usuario.articulos.build(:vendedor_id => @usuario.id)
    3.times {@articulo.categorias.build}
  end

  def edit
    @articulo = Articulo.find(params[:id])
  end
  
  def show
    @articulo = Articulo.find(params[:id])
  end

  def create
    @articulo = Articulo.new(params[:articulo])

    respond_to do |format|
      if @articulo.save
        flash[:notice] = 'Tu articulo se publico exitosamente.'
        format.html { redirect_to perfil_path }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @articulo = Articulo.find(params[:id])

    respond_to do |format|
      if @articulo.update_attributes(params[:articulo])
        flash[:notice] = 'Tu articulo fue editado exitosamente.'
        format.html { redirect_to(@articulo) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @articulo = Articulo.find(params[:id])
    @articulo.destroy

    respond_to do |format|
      format.html { redirect_to(articulos_url) }
    end
  end
  
  def busqueda
		  if params[:busca]
					@articulos = Articulo.find(:all, :conditions => ['nombre LIKE ?', "%#{params[:busca]}%"])
			else
					@articulos = Articulo.find(:all)
			end
  end
end
