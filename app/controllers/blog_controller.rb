class BlogController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authorize_resource!
  skip_after_action :verify_authorized, only: %i[index]

  def index; end
end
