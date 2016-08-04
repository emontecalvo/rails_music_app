# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string
#  session_token   :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'bcrypt'

class User < ApplicationRecord

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum:6, allow_nil: true }
  validates :password_digest, uniqueness: true

  attr_reader :password

  after_initialize :ensure_session_token

  def password=(password)
    @password = password
    pw_digest = BCrypt::Password.create(password)
    self.password_digest = pw_digest
  end

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(32)
  end

  def is_password?(password)
    pw_digest = BCrypt::Password.new(self.password_digest)
    pw_digest.is_password?(password)
  end

  def self.find_by_credentials(email, password)
    potential_user = User.find_by(email: email)
    return nil unless potential_user
    potential_user.is_password?(password) ? potential_user : nil
  end

  def reset_session_token
    self.session_token = SecureRandom::urlsafe_base64(32)
    self.save
    self.session_token
  end

end
