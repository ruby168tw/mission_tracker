class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.identity === 'admin'
        redirect_to users_path
      else
        redirect_to missions_path
      end
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to missions_path, notice: "Logged out"
  end

end
