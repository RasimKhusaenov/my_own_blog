class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  before_action :authenticate_user!
  before_action :authorize_resource!

  expose :decorated_user, -> { UserDecorator.new(current_user) }
end
