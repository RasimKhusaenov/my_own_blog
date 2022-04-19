module Users
  class BaseController < ApplicationController
    include Authentication
    include Authorization

    before_action :authenticate_user!
    before_action :authorize_resource!
  end
end
