class PPagesController < ApplicationController
  before_action :logged_in_user
  before_action :set_groups
  before_action :set_p_page, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ index show new edit update create destroy]
  before_action :set_book, only: %i[ index show new edit update create destroy]

  # GET /p_pages or /p_pages.json
  def index
    @p_pages = PPage.all
  end

  # GET /p_pages/1 or /p_pages/1.json
  def show
    @message = Message.new
    if !@q_page.nil? && !params[:check].nil?
      if @q_page.writer.id == current_user.id
        @q_page.update(check:params[:check]) 
        redirect_to group_book_q_page_path(@group,@book,@q_page)
      end
    end
  end

  # GET /p_pages/new
  def new
    @p_page = PPage.new
  end

  # GET /p_pages/1/edit
  def edit
  end

  # POST /p_pages or /p_pages.json
  def create
    @p_page = PPage.new(p_page_params)

    respond_to do |format|
      if @p_page.save
        format.html { redirect_to group_book_p_page_url(@group,@book,@p_page), notice: "P page was successfully created." }
        format.json { render :show, status: :created, location: @p_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @p_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /p_pages/1 or /p_pages/1.json
  def update
    respond_to do |format|
      if @p_page.update(p_page_params)
        format.html { redirect_to group_book_p_page_url(@group,@book,@p_page), notice: "P page was successfully updated." }
        format.json { render :show, status: :ok, location: @p_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @p_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /p_pages/1 or /p_pages/1.json
  def destroy
    @p_page.destroy

    respond_to do |format|
      format.html { redirect_to group_book_url(@group,@book), notice: "P page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_groups
      @groups = current_user.groups
    end
    
    def set_group
      @group = Group.find_by(id: params[:group_id])
      if @group.nil?
        redirect_to groups_path
      end
      @books = @group.books
    end

    def set_book
      @book = Book.find_by(id: params[:book_id])
      if @book.nil?
        redirect_to home_path(id:@group.id)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_p_page
      @p_page = PPage.find_by(id: params[:id])
      @messages = @p_page.messages
    end

    # Only allow a list of trusted parameters through.
    def p_page_params
      params.require(:p_page).permit(:title, :book_id, :writer_id)
    end
end
