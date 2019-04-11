class User < ApplicationRecord
  has_many :projects, foreign_key: "user_id"

  validates :username, uniqueness: true
  has_secure_password

end
