# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(6, 2)
#  developer   :string
#  description :text
#  rating      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  inventory   :boolean          default(TRUE)
#  supplier_id :integer
#

class Product < ApplicationRecord

  belongs_to :supplier

  has_many :images

  has_many :orders

  has_many :categorized_products
  has_many :categories, through: :categorized_products

  has_many :product_consoles
  has_many :consoles, through: :product_consoles

  has_many :cartedproducts
  has_many :orders, through: :cartedproducts

  validates :name, presence: true
  validates :price, numericality: true
  
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
