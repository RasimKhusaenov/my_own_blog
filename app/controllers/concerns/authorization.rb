module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit::Authorization
    after_action :verify_authorized
    rescue_from Pundit::NotAuthorizedError, with: :deny_access!
  end

  private

  def deny_access!(error)
    redirect_to root_path, alert: error.message
  end
end
