require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  include Authentication
  include Authorization

  before_action :authenticate_user!
  before_action :authorize_resource!

  expose :decorated_user, -> { UserDecorator.new(current_user) }

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  def not_found
    redirect_to :root, notice: I18n.t("helpers.not_found")
  end
end
