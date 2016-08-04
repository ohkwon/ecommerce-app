class OrdersController < ApplicationController

  def new

  end

  def create

    product = Product.find_by(id: params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
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
    @product = Product.find_by(id: @order.product_id)
    @user = User.find_by(id: @order.user_id)
    @cover = Image.where(product_id: @product.id).find_by(name: "Cover")
  end

end
