class UsersController < ApplicationController

  def new

  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if user.save
      flash[:success] = "Account Created!"
      redirect_to "/"
    else
      flash[:danger] = "Invalid Account Name, Email, or Password"
      redirect_to "/signup"
    end

  end

end
