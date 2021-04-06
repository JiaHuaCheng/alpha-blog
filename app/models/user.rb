class User < ApplicationRecord
  validates :user_name, presence: true, length: {minimum: 3, maximum: 25 }, uniqueness: { case_sensitive: false }
  validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

end