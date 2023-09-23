class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ index show new edit update create destroy]
  before_action :set_book, only: %i[ index show new edit update create destroy]

  # GET /messages or /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1 or /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages or /messages.json
  def create
    #@message = Message.new(message_params)
    saved = false
    if params[:page_type] == "0"
      @quest = QPage.find_by(id:params[:page_id])
      saved = !!@quest.messages.create(message_params).id
    elsif params[:page_type] == "1"
      @point = PPage.find_by(id:params[:page_id])
      saved = !!@point.messages.create(message_params).id
    end
    
    respond_to do |format|
      if saved
        if params[:page_type] == "0"
          format.html { redirect_to home_url(id:@group.id,book_id:@book.id,quest_id:params[:page_id]), notice: "Message was successfully created." }
        elsif params[:page_type] == "1"
          format.html { redirect_to home_url(id:@group.id,book_id:@book.id,point_id:params[:page_id]), notice: "Message was successfully created." }
        end
        format.json { render :show, status: :created, location: @message }
      else
        format.html { redirect_to home_url(id:@group.id,book_id:@book.id,page_id:params[:page_id]), status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1 or /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to message_url(@message), notice: "Message was successfully updated." }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1 or /messages/1.json
  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url, notice: "Message was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:body, :writer_id)
    end

    def set_group
      @group = Group.find_by(id: params[:group_id])
      if @group.nil?
        redirect_to groups_path
      end
    end

    def set_book
      @book = Book.find_by(id: params[:book_id])
      if @book.nil?
        redirect_to home_path(id:@group.id)
      end
    end
end
