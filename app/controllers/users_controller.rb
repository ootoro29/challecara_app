class UsersController < ApplicationController
  before_action :logged_in_user,  only: [:show]
  before_action :correct_user, only: [:show]
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

  def alredy_logged_in_user
    if logged_in?
      redirect_to home_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

end
