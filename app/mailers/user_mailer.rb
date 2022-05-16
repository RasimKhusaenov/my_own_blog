class UserMailer < ApplicationMailer
  default from: "noreply@example.com"

  def password_reset(user)
    @token = user.signed_id(purpose: :password_reset, expires_in: User::TOKEN_EXPIRATION_TIME)
    @user = user

    mail(to: @user.email)
  end
end
