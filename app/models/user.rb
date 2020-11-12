class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :username, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 30}
  validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { maximum: 105 }, format: { with: VALID_EMAIL_REGEX }
end