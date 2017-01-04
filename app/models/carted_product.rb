# == Schema Information
#
# Table name: carted_products
#
#  id         :integer          not null, primary key
#  product_id :integer
#  order_id   :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartedProduct < ApplicationRecord

  belongs_to :product
  belongs_to :order

end
