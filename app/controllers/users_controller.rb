class UsersController < ApplicationController
  skip_after_action :verify_authorized, only: %i[new create]
  before_action -> { authorize User }, only: %i[show edit update]

  expose :user

  def show; end

  def new; end

  def create
    if user.save
      session[:current_user_id] = user.id
      redirect_to root_path, notice: I18n.t("authentication.sign_up.success")
    else
      render :new
    end
  end

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
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
