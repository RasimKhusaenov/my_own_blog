module Users
  class RegistrationsController < ApplicationController
    skip_before_action :authenticate_user!
    skip_before_action :authorize_resource!
    skip_verify_authorized

    expose :user

    def new; end

    def create
      if user.save
        session[:current_user_id] = user.id
        redirect_to root_path, notice: I18n.t("flash.authentication.sign_up.success")
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
  end
end
