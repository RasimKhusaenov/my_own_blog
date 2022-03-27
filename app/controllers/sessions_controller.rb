# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    current_user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if current_user
      session[:current_user_id] = current_user.id
      redirect_to blog_path, notice: "You've successfully signed in!"
    else
      @user = User.new
      @user.errors.add :base, "Wrong email or password"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
