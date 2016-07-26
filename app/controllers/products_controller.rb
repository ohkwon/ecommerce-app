class ProductsController < ApplicationController

  def index
    @products = Product.all.sort_by{ |product| product.name}
  end

  def show
    @id = params[:id]
    @product = Product.find_by(id: @id )
  end

  def new

  end

  def create
    name = params[:name]
    price = params[:price]
    image = params[:image]
    developer = params[:developer]
    description = params[:description]
    console = params[:console]
    rating = params[:rating]
    product = Product.new({name: name, price: price, image: image, developer: developer, description: description, console: console, rating: rating})
    product.save
    redirect_to "/products/#{product.id}"
  end

  def edit
    @id = params[:id]
    @product = Product.find_by(id: @id )
  end

  def update
    @id = params[:id]
    name = params[:name]
    price = params[:price]
    image = params[:image]
    developer = params[:developer]
    description = params[:description]
    console = params[:console]
    rating = params[:rating]
    product = Product.find_by(id: @id)
    product.assign_attributes({name: name, price: price, image: image, developer: developer, description: description, console: console, rating: rating})
    product.save
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @id = params[:id]
    product = Product.find_by(id: @id)
    product.destroy
    redirect_to "/products"
  end

end
