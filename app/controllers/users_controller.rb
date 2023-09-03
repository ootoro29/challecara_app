class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    alredy_logged_in_user
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to home_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def alredy_logged_in_user
    if logged_in?
      redirect_to home_url
    end
  end
end
