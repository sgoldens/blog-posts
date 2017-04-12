class User < ApplicationRecord
  has_secure_password
  has_secure_token
  has_many :posts
  
  validates  :name, :uniqueness => true
  validates  :email, :uniqueness => true
  validates  :password_digest, :presence => true

  # This method is not available in has_secure_token
  def invalidate_token
    self.update_columns(token: nil)
  end

  def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end
end