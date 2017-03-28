# require "bcrypt"

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  def password
    # @password = @password || BCrypt::Password.new(password_digest)
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(plaintext_password)
    encrypted_password = BCrypt::Password.create(plaintext_password)
    self.password_digest = encrypted_password
  end
end
