class ResetPasswordForm
  include ActiveModel::Model

  attr_accessor :new_password, :password_confirmation

  validates :new_password, presence: true
  validate :check_password_confirmation

  def initialize(attributes, user)
    @attributes = attributes
    @user = user

    assign_attributes
  end

  def validate
    super

    errors.blank?
  end

  private

  attr_reader :attributes, :user

  def check_password_confirmation
    return if new_password == password_confirmation

    errors.add(:password_confirmation, :invalid)
  end

  def assign_attributes
    attributes.each { |key, value| public_send "#{key}=", value }
  end
end
