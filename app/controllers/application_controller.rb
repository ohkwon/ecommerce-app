class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :calculate_cart_count

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

  def calculate_cart_count

    if current_user && order = current_user.orders.find_by(completed: false)
      if session[:cart_count]
        @cart_count = session[:cart_count]
      else
        carted_products = CartedProduct.where(order_id: order.id)
        @cart_count = 0
        carted_products.each do |carted_product|
          @cart_count += carted_product.quantity
      end
      session[:cart_count] = @cart_count

    end

  end
  
end

end
