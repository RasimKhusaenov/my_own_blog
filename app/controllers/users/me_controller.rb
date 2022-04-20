module Users
  class MeController < BaseController
    def show; end

    def edit; end

    def update
      current_user.update(user_params)

      respond_with current_user, location: users_me_path
    end

    private

    def authorize_resource!
      authorize! current_user, with: Users::MePolicy
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
end
