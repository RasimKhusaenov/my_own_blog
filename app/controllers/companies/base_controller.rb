module Companies
  class BaseController < ApplicationController
    include Authentication
    include Authorization

    before_action :authorize_resource!
  end
end
