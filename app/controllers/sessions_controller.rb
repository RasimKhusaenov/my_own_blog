# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_after_action :verify_authorized

  def new
    @user = User.new
  end

  def create
    authenticated_user = authenticate_user

    if authenticated_user
      session[:current_user_id] = authenticated_user.id
      redirect_to blog_path, notice: I18n.t("authentication.sign_in.success")
    else
      redirect_to new_session_path, flash: { alert: I18n.t("authentication.sign_in.failure") }
    end
  end

  def destroy
    session.delete(:current_user_id)

    redirect_to blog_path, notice: I18n.t("authentication.sign_out.success")
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def authenticate_user
    User.find_by(email: user_params[:email])&.authenticate(user_params[:password])
  end
end
