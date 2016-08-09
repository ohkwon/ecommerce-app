class User < ApplicationRecord
  has_secure_password

  has_many :orders
  
  validates :name, presence: true
  validates :email, uniqueness: true
  # validates :email, inclusion: { in: %w(.com),
  #   message: "must be a valid email"}
  validates :password, length: { in: 5..15 }

end
