class RegistrationsController < ApplicationController
  expose :company, -> { Company.find_by(slug: request.subdomain) }
  expose :user

  def new; end

  def create
    session[:current_user_id] = register_user.user&.id
    respond_with register_user.user,
                 location: root_url(subdomain: company&.slug)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def register_user
    @register_user ||= RegisterUser.call(company: company, user_params: user_params)
  end
end
