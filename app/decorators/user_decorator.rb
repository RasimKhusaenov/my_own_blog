class UserDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}".squish
  end
end
