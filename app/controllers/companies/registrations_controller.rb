module Companies
  class RegistrationsController < Companies::BaseController
    expose :company, find_by: :slug
    expose :user

    def new; end

    def create
      self.user = register_user.user

      if register_user.success?
        session[:current_user_id] = user.id
        respond_with user, location: root_path
      else
        respond_with user, alert: register_user.error
      end
    end

    private

    def authorize_resource!
      authorize! company, with: Companies::RegistrationPolicy
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def register_user
      @register_user ||= RegisterUser.call(company: company, user_params: user_params)
    end
  end
end
