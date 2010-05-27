class SessionsController < ApplicationController
  layout 'layout'
  def new
  end
  
  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      flash[:notice] = "Identificado con éxito."
      redirect_to_target_or_default(root_url)
    else
      flash.now[:error] = "No válida de acceso o contraseña."
      render :action => 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Se le ha cerrado la sesión."
    redirect_to root_url
  end
end
