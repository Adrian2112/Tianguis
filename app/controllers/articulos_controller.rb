class ArticulosController < ApplicationController
  
  before_filter :autorizar, :except => ["show", "busqueda", "index"]

  def index
    @articulos = Articulo.find(:all , :conditions => [ 'nombre LIKE ?', "%#{params[:busqueda]}%"])
    @title = "Busqueda..."
  end

  def new
    @usuario = Usuario.find(session[:user_id])
    @articulo = @usuario.articulos.build(:vendedor_id => @usuario.id)
    @title = "Vendiendo..."
  end

  def edit
    @articulo = Articulo.find(params[:id])
  end

  def show
    @articulo = Articulo.find(params[:id])
  end

  def create
    @articulo = Articulo.new(params[:articulo])
    @articulo = Articulo.create( params[:articulo] )
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
    @articulos = Articulo.find(:all , :conditions => [ 'nombre LIKE ?', "%#{params[:busqueda]}%"])
    @title = "Buscando..."
  end

  def comprar
    @articulo = Articulo.find(params[:id])
    @articulo.status = 1
    @articulo.comprador_id = session[:user_id]
    @articulo.save
    redirect_to perfil_path
  end

end
