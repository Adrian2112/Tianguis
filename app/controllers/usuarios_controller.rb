class UsuariosController < ApplicationController
  
  def new
    @usuario = Usuario.new    
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end

  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        flash[:notice] = 'Tu usuario fue creado exitosamente'
        session[:user_id] = @usuario.id
        format.html { redirect_to perfil_path}
      else
        flash[:notice] = 'no'
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'Tus datos fueron actualizados exitosamente.'
        format.html { redirect_to :action => "perfil", :id => @usuario.id }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
    end
  end
  
  def perfil
    @usuario = Usuario.find(session[:user_id])
    @articulos = Articulo.find_all_by_vendedor_id(session[:user_id])
  end
  
  protected  
  def autorizar    
  end
  
end
