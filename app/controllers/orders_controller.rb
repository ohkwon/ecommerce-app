class OrdersController < ApplicationController

  def new

  end

  def create

    product = Product.find_by(id: params[:product][:id])
    subtotal = product.price * params[:quantity]
    tax = subtotal * 1.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product][:id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: total
      )
    if order.save
      flash[:success] = "You successfully made your order!"
      redirect_to "/orders/#{order.id}"
    else
      flash[:danger] = "Error, please check if you are logged in!"
      redirect_to "/"
    end

  end

  def show
    @order = Order.find_by(id: params[:id])
  end

end
