class UsersController < ApplicationController
  layout 'layout'
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if verify_recaptcha(:model => @user, :message => 'leena mejor nderasatu mbae') and @user.save
      session[:user_id] = @user.id
      flash[:notice] = "¡Gracias por registrarte! Ahora está conectado"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end
