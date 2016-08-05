class ConsolesController < ApplicationController

  def new
    @number_of_consoles = params[:number_of_consoles]
    @counter = 0
  end

  def create
    @counter.times do
      
    end
  end

end
