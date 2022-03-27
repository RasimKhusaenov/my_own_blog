# frozen_string_literal: true

class BlogController < ApplicationController
  before_action :authenticate_current_user!, except: %i[index]
  skip_after_action :verify_authorized, only: %i[index]

  def index; end
end
