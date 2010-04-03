class ArticulosController < ApplicationController
  
  def new
    @usuario = Usuario.find(session[:user_id])
    @articulo = @usuario.articulos.build(:vendedor_id => @usuario.id)
  end

  def edit
    @articulo = Articulo.find(params[:id])
  end

  def create
    @articulo = Articulo.new(params[:articulo])

    respond_to do |format|
      if @articulo.save
        flash[:notice] = 'Tu articulo se publico correctamente.'
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
        flash[:notice] = 'Articulo was successfully updated.'
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
    @articulos = Articulo.all
  end
end
