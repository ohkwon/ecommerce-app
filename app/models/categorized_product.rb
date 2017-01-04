# == Schema Information
#
# Table name: categorized_products
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CategorizedProduct < ApplicationRecord

  belongs_to :product
  belongs_to :category

end
