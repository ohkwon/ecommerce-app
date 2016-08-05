class ImagesController < ApplicationController

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

  def destroy

  end

  def show
    @images = Image.where(product_id: params[:id])
  end

end
