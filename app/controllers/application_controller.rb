class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  protected
  def autorizar
    unless Usuario.find_by_id(session[:user_id])
      session[:original_uri] = request.request_uri
      flash[:notice] = "Por favor inicia sesión"
      redirect_to :controller => 'acceso', :action => 'login'
    end
  end
end
