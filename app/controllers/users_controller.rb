class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: %i[new create]

  def show
    authorize User
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to blog_path, notice: I18n.t("authentication.sign_up.success")
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
