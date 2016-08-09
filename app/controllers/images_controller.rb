class ImagesController < ApplicationController

  before_action :authenticate_admin!, except: [:show]

  def new

  end

  def create
    image = Image.new(name: params[:name], url: params[:url], product_id: params[:product_id])
    if image.save
      flash[:success] = "Image Saved!"
      redirect_to "/products/#{image.product_id}"
    else
      flash[:danger] = "Error: Image not saved!"
      redirect_to "/images/new?product_id=<%= params[:product_id] %>"
    end
    
  end

  def to_destroy
    @images = Image.where(product_id: params[:product_id])
  end

  def destroy
    image = Image.find_by(id: params[:id])
    image.destroy
    flash[:warning] = "Product destroyed!"
    redirect_to "/products"
  end

  def show
    @images = Image.where(product_id: params[:id]).where("name LIKE ?", "screenshot_%")
    @counter = 0
  end

end
