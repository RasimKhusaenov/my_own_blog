module Authentication
  extend ActiveSupport::Concern

  class UserNotAuthenticated < StandardError; end

  included do
    rescue_from UserNotAuthenticated, with: :not_authenticated!
    helper_method :current_user, :current_company
  end

  def authenticate_user!
    return if session[:current_user_id] && current_user.present?

    raise UserNotAuthenticated, "No current_user_id in session"
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def current_company
    @current_company ||= Company.find_by(subdomain: request.subdomain)
  end

  private

  def not_authenticated!
    redirect_to new_session_path, alert: I18n.t("flash.unauthenticated")
  end
end
