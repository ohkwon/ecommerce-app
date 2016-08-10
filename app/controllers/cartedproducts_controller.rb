class CartedproductsController < ApplicationController

  before_action :authenticate_user!

  def create

    if order = current_user.orders.find_by(completed: false)
      add_cart = CartedProduct.new(
        product_id: params[:product_id],
        quantity: params[:quantity],
        order_id: order.id
        )
      add_cart.save
    else
      order = Order.new(
        user_id: current_user.id,
        completed: false,
        subtotal: 0,
        tax: 0,
        total: 0
        )
      order.save

      add_cart = CartedProduct.new(
        product_id: params[:product_id],
        quantity: params[:quantity],
        order_id: order.id
        )
      add_cart.save
    end

    session[:cart_count] = nil
    flash[:success] = "Product successfully added to cart"
    redirect_to '/cartedproducts/index'

  end

  def index
    
    if @order = current_user.orders.find_by(completed: false)

      @order.subtotal = 0
      @order.tax = 0
      @order.total = 0

      @carted_products = CartedProduct.where(order_id: @order.id)
      @carted_products.each do |carted_product|
        @order.subtotal += carted_product.quantity * carted_product.product.price
        @order.tax += @order.subtotal * 0.09
        @order.total += @order.subtotal * 1.09
        @order.save
        
      end
    else
      flash[:warning] = "Your cart is empty, please add an item first!"
      redirect_to '/'
    end

  end

  def update
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.quantity = params[:quantity]
    carted_product.save
    flash[:success] = "Quantity Updated!"
    redirect_to '/cartedproducts/index'
  end

  def destroy
    order = Order.find_by(id: params[:order_id])
    carted_product = CartedProduct.find_by(id: params[:id])

    carted_product.destroy
    flash[:success] = "Item deleted!"
    redirect_to "/cartedproducts/index"
  end


end
