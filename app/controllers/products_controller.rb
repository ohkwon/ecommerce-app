class ProductsController < ApplicationController

  def index
    sort_attribute = params[:sort_attribute]
    if sort_attribute
      @products = Product.order(sort_attribute)
    elsif params[:search]
      @products = Product.all.where("name ILIKE ?", "%#{params[:search]}%")
    elsif params[:category_id]
      @products = Category.find_by(id: params[:category_id]).products
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

  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      developer: params[:developer],
      description: params[:description],
      console: params[:console],
      rating: params[:rating],
      inventory: "true",
      supplier_id: params[:supplier][:supplier_id]
      )
    product.save

    # image = params[:image]
    # image_name = params[:image_name]
    # if product.save
    #   image_new = image.new({name: image_name, url: image, product_id: product.id.to_i})
    #   image_new.save
    # end

    #still has rollback issue
    flash[:success] = "Product created!"
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
    developer = params[:developer]
    description = params[:description]
    console = params[:console]
    rating = params[:rating]
    inventory = params[:inventory]
    product = Product.find_by(id: @id)
    product.assign_attributes({name: name, price: price, developer: developer, description: description, console: console, rating: rating, inventory: inventory})
    product.save

    # image = params[:image]
    # image_name = params[:image_name]
    # if product.save
    #   image_new = image.new({name: image_name, url: image, product_id: product.id.to_i})
    #   image_new.save
    # end
    flash[:success] = "Product updated!"
    redirect_to "/products/#{product.id}"
  end

  def destroy
    @id = params[:id]
    product = Product.find_by(id: @id)
    product.destroy
    flash[:warning] = "Product destroyed!"
    redirect_to "/products"
  end


end
