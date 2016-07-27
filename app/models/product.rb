class Product < ApplicationRecord

  def sale_message
    if price.to_f < 2
      return "Discount item!"
    elsif price.to_f >= 2
      return "On Sale!"
    end
  end

end
