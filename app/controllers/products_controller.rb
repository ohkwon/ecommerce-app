class ProductsController < ApplicationController

  before_action :authenticate_admin!, except: [:index, :show]

  def index
    sort_attribute = params[:sort_attribute]
    if sort_attribute
      @products = Product.order(sort_attribute)
    elsif params[:search]
      @products = Product.all.where("name ILIKE ?", "%#{params[:search]}%").sort_by{ |product| product.name}
    elsif params[:category_id]
      @products = Category.find_by(id: params[:category_id]).products.sort_by{ |product| product.name}
    elsif params[:console_id]
      @products = Console.find_by(id: params[:console_id]).products.sort_by{ |product| product.name}
    else
      @products = Product.all.sort_by{ |product| product.name}
    end
  end

  def show
    @id = params[:id]
    @product = Product.find_by(id: @id )
    if @product
      @image_cover = @product.images.find_by(name: "Cover")
      @screenshots = @product.images.where.not(name: "Cover")
      flash.now[:success] = @product.sale_message
    end
  end

  def new

    @product = Product.new

  end

  def create

    @product = Product.new(
      name: params[:name],
      price: params[:price],
      developer: params[:developer],
      description: params[:description],
      rating: params[:rating],
      inventory: "true",
      supplier_id: params[:supplier][:supplier_id]
      )
    if @product.save

      flash[:success] = "Product created!"
      redirect_to "/products/#{@product.id}"

    else

      flash[:danger] = "Error!"
      render :new

    end

  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update

    @product = Product.find_by(id: params[:id])
    @product.assign_attributes({
      name: params[:name],
      price: params[:price],
      developer: params[:developer],
      description: params[:description],
      rating: params[:rating],
      inventory: params[:inventory]
      })
    if @product.save

      flash[:success] = "Product updated!"
      redirect_to "/products/#{@product.id}"

    else

      flash[:danger] = "Error!"
      render :edit

    end

  end

  def destroy

    product = Product.find_by(id: params[:id])
    product.destroy
    flash[:warning] = "Product destroyed!"
    redirect_to "/products"

  end

end
