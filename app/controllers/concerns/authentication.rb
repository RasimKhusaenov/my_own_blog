# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  class UserNotAuthenticated < StandardError; end

  included do
    rescue_from UserNotAuthenticated, with: :not_authenticated!
    helper_method :current_user
  end

  def authenticate_current_user!
    return if session[:current_user_id] && current_user.present?

    raise UserNotAuthenticated, I18n.t("authentication.not_authenticated.system")
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  private

  def not_authenticated!
    redirect_to new_session_path, alert: I18n.t("authentication.not_authenticated.user")
  end
end
