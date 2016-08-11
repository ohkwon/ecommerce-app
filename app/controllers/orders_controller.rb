class OrdersController < ApplicationController

  before_action :authenticate_user!

  # def new

  # end

  # def create

  # end

  def show
    # @order = Order.find_by(id: params[:id])
    # @product = Product.find_by(id: @order.product_id)
    # @user = User.find_by(id: @order.user_id)
    # @cover = Image.where(product_id: @product.id).find_by(name: "Cover")

    if @order = current_user.orders.find_by(completed: params[:id])
      @carted_products = CartedProduct.where(order_id: @order.id)
      @quantity = 0
      @carted_products.each do |carted_product|
        @quantity += carted_product.quantity
      end
    else
      flash[:warning] = "Your cart is empty, please add an item first!"
      redirect_to '/'
    end

  end

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def update

    @order = current_user.orders.find_by(completed: false)

    binding.pry

    @order.completed = true

    @carted_products = CartedProduct.where(order_id: @order.id)

    @carted_products.each do |carted_product|
      @order.subtotal += carted_product.quantity * carted_product.product.price
      @order.tax += @order.subtotal * 0.09
      @order.total += @order.subtotal * 1.09
      @order.save
    end

    session[:cart_count] = nil
    flash[:success] = "Thank you for you patronage!"
    redirect_to 'orders/#{@order.id}'

  end

end
