# == Schema Information
#
# Table name: consoles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Console < ApplicationRecord

  has_many :product_consoles
  has_many :products, through: :product_consoles

end
