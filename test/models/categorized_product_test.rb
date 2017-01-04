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

require 'test_helper'

class CategorizedProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
