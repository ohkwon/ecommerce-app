class ImagesController < ApplicationController

  def new

  end

  def create
    image = Image.new(name: params[:name], url: params[:url], product_id: params[:product_id])
    if image.save
      flash[:success] = "Image Saved!"
      redirect_to "/"
    else
      flash[:danger] = "Error: Image not saved!"
      redirect_to "/images/new?product_id=<%= params[:product_id] %>"
    end
    
  end

  def destroy

  end

end
