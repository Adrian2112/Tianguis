class AccesoController < ApplicationController
  def login
    session[:usuario_id] = nil
    if request.post?
      user = Usuario.authenticate(params[:nickname], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(uri || perfil_path)
      else
        flash.now[:notice] = "Usuario y/o contraseña incorrectas"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to :action => "login"
  end
end