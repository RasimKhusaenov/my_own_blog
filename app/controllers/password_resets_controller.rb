class PasswordResetsController < ApplicationController
  expose :password_form, :build_password_form

  def new; end

  def create
    user = User.find_by(email: params[:email])

    UserMailer.password_reset(user).deliver_later if user.present?

    redirect_to root_path, notice: I18n.t("flash.password_resets.create.success")
  end

  def edit
    User.find_signed!(params[:token], purpose: :password_reset)
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_session_path, alert: I18n.t("flash.password_resets.edit.failure")
  end

  def update
    update_password if password_form.validate

    respond_with password_form, location: new_session_path
  end

  private

  def update_password
    user = User.find_signed!(params[:token], purpose: :password_reset)

    user.update(password: password_form_params[:new_password])
  end

  def build_password_form
    ResetPasswordForm.new(password_form_params, current_user)
  end

  def password_form_params
    params.fetch(:reset_password_form, {}).permit(:new_password, :password_confirmation)
  end
end
