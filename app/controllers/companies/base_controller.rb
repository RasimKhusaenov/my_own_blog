module Companies
  class BaseController < ApplicationController
    include Authorization

    before_action :authorize_resource!
  end
end
