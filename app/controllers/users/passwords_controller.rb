module Users
  class PasswordsController < ApplicationController
    skip_before_action :authorize_resource!
    skip_verify_authorized

    def new; end

    def create
      if current_password_matches? && new_passwords_matches? && new_password_present?
        current_user.update(password: user_params[:new_password])
        redirect_to user_path, notice: I18n.t("flash.user.password.update.success")
      else
        redirect_to new_user_password_path, alert: I18n.t("flash.user.password.update.failure")
      end
    end

    private

    def current_password_matches?
      current_user.authenticate(user_params[:current_password])
    end

    def new_password_present?
      user_params[:new_password].present?
    end

    def new_passwords_matches?
      user_params[:new_password] == user_params[:new_password_confirmation]
    end

    def user_params
      params.require(:user).permit(:current_password, :new_password, :new_password_confirmation)
    end
  end
end
