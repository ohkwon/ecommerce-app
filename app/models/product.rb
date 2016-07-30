class Product < ApplicationRecord

  def sale_message
    if price < 2
      return "Discount item!"
    elsif price >= 2
      return "On Sale!"
    end
  end

  def tax
    (price * 0.09)
  end

  def total
    (price * 1.09)
  end
end
