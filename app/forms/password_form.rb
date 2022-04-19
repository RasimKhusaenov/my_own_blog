class PasswordForm
  include ActiveModel::Model

  attr_accessor :current_password, :new_password, :password_confirmation

  validates :current_password, presence: true
  validates :new_password, presence: true
  validate :check_current_password, :check_password_confirmation

  def initialize(attributes, user)
    @attributes = attributes
    @user = user

    assign_attributes
  end

  def validate
    super

    validate_model

    errors.blank?
  end

  private

  attr_reader :attributes, :user

  def check_current_password
    return if user.valid_password?(current_password)

    errors.add(:current_password, :invalid)
  end

  def check_password_confirmation
    return if new_password == password_confirmation

    errors.add(:password_confirmation, :invalid)
  end

  def assign_attributes
    attributes.each { |key, value| public_send "#{key}=", value }
  end

  def validate_model
    user.assign_attributes(password: new_password)

    errors.add(:base, user.errors.full_messages.to_sentence) if user.invalid?
  end
end
