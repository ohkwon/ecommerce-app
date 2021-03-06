class SessionsController < ApplicationController

  def new
    if session[:user_id]
      redirect_to "/"
    end
  end


  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.name}!"
      redirect_to "/"
    else
      flash[:danger] = "Invalid email or password!"
      redirect_to "/login"
    end
  end

  def destroy
    if session[:user_id]
      session[:user_id] = nil
      flash[:success] = "You have successfully logged out!"
      redirect_to "/login"
    else
      redirect_to "/login"
    end
  end

end
