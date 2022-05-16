class ResetPasswordForm
  include ActiveModel::Model

  attr_accessor :new_password, :password_confirmation

  validates :new_password, :password_confirmation, presence: true
  validate :check_password_confirmation

  def initialize(attributes)
    @attributes = attributes

    assign_attributes
  end

  private

  attr_reader :attributes

  def check_password_confirmation
    return if new_password == password_confirmation

    errors.add(:password_confirmation, :invalid)
  end

  def assign_attributes
    attributes.each { |key, value| public_send "#{key}=", value }
  end
end
