# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  admin           :boolean          default(FALSE)
#

class User < ApplicationRecord
  has_secure_password

  has_many :orders
  
  validates :name, presence: true
  validates :email, uniqueness: true
  # validates :email, inclusion: { in: %w(.com),
  #   message: "must be a valid email"}
  validates :password, length: { in: 5..15 }

end
