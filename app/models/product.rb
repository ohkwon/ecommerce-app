class Product < ApplicationRecord

  def sale_message
    if price.to_f < 2
      return "Discount item!"
    elsif price.to_f >= 2
      return "On Sale!"
    end
  end

  def tax
    (price.to_f * 0.09).round(2)
  end

  def total
    (price.to_f * 1.09).round(2)
  end
end
