class HomePagesController < ApplicationController
  before_action :logged_in_user
  def home
    @group = current_user.groups.find_by(id: params[:id])
    if !@group.nil?
       @books = @group.books
    end
  end

  private
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

end
