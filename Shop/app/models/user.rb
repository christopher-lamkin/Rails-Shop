class User < ApplicationRecord
  has_one :cart

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 30 }
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 },
            format: { with: EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  has_secure_password
end
