# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  name       :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

class Image < ApplicationRecord
  belongs_to :product
end
