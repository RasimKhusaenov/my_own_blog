class SessionsController < ApplicationController
  expose :user, :fetch_user

  def new; end

  def create
    if authenticate_user
      session[:current_user_id] = user.id

      respond_with user, location: root_path
    else
      redirect_to new_session_path, alert: I18n.t("flash.sessions.create.failure")
    end
  end

  def destroy
    session.delete(:current_user_id)

    redirect_to new_session_path, notice: I18n.t("flash.sessions.destroy.success")
  end

  private

  def fetch_user
    User.find_or_initialize_by(email: user_params[:email])
  end

  def authenticate_user
    user&.valid_password?(user_params[:password])
  end

  def user_params
    @user_params ||= params.fetch(:user, {})
  end
end
