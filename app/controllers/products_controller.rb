class ProductsController < ApplicationController

  def index
    @products = Product.all
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
    @product = Product.new({name: name, price: price, image: image, developer: developer, description: description, console: console, rating: rating})
    @product.save
  end

end
