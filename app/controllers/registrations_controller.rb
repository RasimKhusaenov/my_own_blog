class RegistrationsController < ApplicationController
  expose :user

  def new; end

  def create
    session[:current_user_id] = user.id if user.save

    respond_with user, location: root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
