class HomePagesController < ApplicationController
  before_action :logged_in_user
  before_action :set_groups
  before_action :set
  def home

  end

  def update
    if !@quest.nil? && !params[:check].nil?
      if @quest.writer.id == current_user.id
        if params[:check] == '0'
          @quest.update(check:false)
        elsif params[:check] == '1'
          @quest.update(check:true)
        end
      end
      redirect_to home_url(id:@group.id,book_id:@book.id,quest_id:@quest.id)
    end
  end

  private
  def set_groups
    @groups = current_user.groups
  end
  def set
    @group = current_user.groups.find_by(id: params[:id])
    if !@group.nil?
       @books = @group.books
       @book = @group.books.find_by(id: params[:book_id])
       @members = @group.users;
       if !@book.nil?
        @QPages = @book.q_pages;
        @PPages = @book.p_pages;
        @quest = @book.q_pages.find_by(id: params[:quest_id])
        @point = @book.p_pages.find_by(id: params[:point_id])
        if !@quest.nil? || !@point.nil?
          @message = Message.new
          if !@quest.nil?
            @messages = @quest.messages
          else
            @messages = @point.messages
          end
        end
       end
    end
    @invites = current_user.invites
  end

end
