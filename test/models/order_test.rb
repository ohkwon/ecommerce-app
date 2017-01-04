# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subtotal   :decimal(7, 2)
#  tax        :decimal(7, 2)
#  total      :decimal(7, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  completed  :boolean
#

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
