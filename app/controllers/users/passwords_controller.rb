module Users
  class PasswordsController < Users::BaseController
    expose :password_form, :build_password_form

    def edit; end

    def update
      update_password if password_form.validate

      respond_with password_form, location: users_me_path
    end

    private

    def update_password
      current_user.update(password: password_form_params[:new_password])
    end

    def authorize_resource!
      authorize! current_user, with: Users::PasswordPolicy
    end

    def build_password_form
      UpdatePasswordForm.new(password_form_params, current_user)
    end

    def password_form_params
      params.fetch(:update_password_form, {}).permit(:current_password, :new_password, :password_confirmation)
    end
  end
end
