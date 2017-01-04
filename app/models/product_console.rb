# == Schema Information
#
# Table name: product_consoles
#
#  id         :integer          not null, primary key
#  product_id :integer
#  console_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductConsole < ApplicationRecord

  belongs_to :product
  belongs_to :console
  
end
