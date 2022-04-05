class BlogController < ApplicationController
  before_action :authenticate_current_user!, only: %i[]
  skip_after_action :verify_authorized, only: %i[index]

  def index; end
end
