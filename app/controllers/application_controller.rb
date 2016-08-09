class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_user!

    if current_user

    else
      flash[:danger] = "Please log in first!"
      redirect_to '/'
    end

  end

  def authenticate_admin!
    
    if current_user && current_user.admin

    else
      flash[:danger] = "You must be an admin to do that!"
      redirect_to '/'
    end

  end

end
