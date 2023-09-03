class SessionsController < ApplicationController
  def new
    alredy_logged_in_user
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to home_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new', status: :unprocessable_entity
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def alredy_logged_in_user
    if logged_in?
      redirect_to home_url
    end
  end
end
