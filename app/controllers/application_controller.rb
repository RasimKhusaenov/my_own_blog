class ApplicationController < ActionController::Base
  include Authentication

  self.responder = ApplicationResponder
  respond_to :html

  expose :decorated_user, -> { UserDecorator.new(current_user) }

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    redirect_to :root, notice: I18n.t("helpers.not_found")
  end
end
