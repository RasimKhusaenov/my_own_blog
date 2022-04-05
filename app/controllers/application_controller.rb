class ApplicationController < ActionController::Base
  include Authentication
  include Authorization

  expose :decorated_user, -> { UserDecorator.new(current_user) }
end
