class AccesoController < ApplicationController
  def login
    unless session[:user_id] == nil
      redirect_to perfil_path
    end
    if request.post?
      user = Usuario.authenticate(params[:nickname], params[:password])
      if user
        session[:user_id] = user.id
        uri = session[:original_uri]
        session[:original_uri] = nil
        redirect_to(perfil_path)
      else
        flash.now[:notice] = "Usuario y/o contraseña incorrectas"
      end
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to login_path
  end
end
