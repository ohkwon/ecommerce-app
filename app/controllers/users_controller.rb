class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
      )
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You created your account, #{params[:name]}!"
      redirect_to "/"
    else
      flash[:danger] = "Error"
      render :new
    end

  end

  def show

    if session[:user_id]
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to "/login"
    end

  end

end
