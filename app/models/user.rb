class User < ApplicationRecord
  has_secure_password
  has_many :likes
  has_many :posts_liked, through: :likes, source: :post

  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, :presence => true, length: { in: 2..20 }
  validates :email, :uniqueness => { :case_sensitive => false }, :format => { :with => email_regex }
  validates :password, length: { minimum: 8 }, allow_nil: true

end
