class UsersController < ApplicationController
  skip_before_action :authorize_resource!
  skip_verify_authorized

  expose :user

  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
