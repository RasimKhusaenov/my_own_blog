module Authentication
  extend ActiveSupport::Concern

  class CompanyNotAuthenticated < StandardError; end
  class UserNotAuthenticated < StandardError; end

  included do
    rescue_from CompanyNotAuthenticated, with: :not_authenticated!
    rescue_from UserNotAuthenticated, with: :not_authenticated!
    helper_method :current_user
  end

  def authenticate_company!
    return if params[:company_id] && company.present?

    raise CompanyNotAuthenticated, "No company_id in params"
  end

  def authenticate_user!
    return if session[:current_user_id] && current_user.present?

    raise UserNotAuthenticated, "No current_user_id in session"
  end

  def company
    @company ||= Company.friendly.find(params[:company_id])
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  private

  def not_authenticated!
    redirect_to new_session_path, alert: I18n.t("flash.unauthenticated")
  end
end
