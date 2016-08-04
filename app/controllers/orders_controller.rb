class OrdersController < ApplicationController

  def new

  end

  def create

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product][:id],
      quantity: params[:quantity]
      )
    if order.save
      flash[:success] = "You successfully made your order!"
      redirect_to "/orders/#{order.id}"
    else
      flash[:danger] = "Error, please check if you are logged in!"
      redirect_to "/"
    end

  end

end
