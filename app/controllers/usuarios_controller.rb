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

 def validateNickname
    color = 'red'
    username = params[:nickname]
    if username.length < 5
      message = 'Tu nombre de usuario es muy corto'
    elsif username.length > 10
      message = 'Tu nombre de usuario es muy largo'
    else
      user = Usuario.find_all_by_nickname(username)      
      if user.size > 0        
        message = 'Tu nombre de usuario ya esta ocupado'     
      else
        message = 'Tu nombre de usuario esta disponible'
        color = 'green'
      end
    end
    @message = "<span style='color:#{color}; font-size:15px'>#{message}</span>"
    render :partial=>'message'
  end
  
 def validateEmail
    color = 'red'
    username = params[:email]
      user = Usuario.find_all_by_email(username)      
			coincidencia = username.match(/([a-z0-9_.-]+)@([a-z0-9-]+)\.([a-z.]+)/i)
			if coincidencia.nil?
			message = 'Mail incorrecto'
			elsif !coincidencia.nil?
			message = 'Mail Correcto'
			color = 'green'
end
    @messageEmail = "<span style='color:#{color}; font-size:15px'>#{message}</span>"
    render :partial=>'messageEmail'
  end

  protected  
  def autorizar    
  end
  
end
