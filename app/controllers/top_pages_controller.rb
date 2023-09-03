class TopPagesController < ApplicationController
  def top
    if logged_in?
      redirect_to home_path
    else
      render 'top'
    end
  end
end
