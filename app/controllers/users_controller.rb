class UsersController < Users::BaseController
  def show; end

  def edit; end

  def update
    current_user.update(user_params)

    respond_with current_user, location: user_path
  end

  private

  def authorize_resource!
    authorize! current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
