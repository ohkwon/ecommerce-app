class Product < ApplicationRecord

  belongs_to :supplier

  has_many :images

  has_many :orders

  has_many :categorized_products
  has_many :categories, through: :categorized_products

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
