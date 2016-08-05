class Console < ApplicationRecord

  has_many :product_consoles
  has_many :products, through: :product_consoles

end
