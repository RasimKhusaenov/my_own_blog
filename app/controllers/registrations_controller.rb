class RegistrationsController < ApplicationController
  expose :user

  def new; end

  def create
    if register_user.success?
      session[:current_user_id] = register_user.user.id
      respond_with register_user.user, location: root_path
    else
      respond_with register_user.user, alert: register_user.error
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def register_user
    @register_user ||=
      RegisterUser.call(company: current_company, user_params: user_params)
  end
end
