# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true

  def to_s
    full_name.presence || email
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
