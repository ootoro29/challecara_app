class QPagesController < ApplicationController
  before_action :set_q_page, only: %i[ show edit update destroy ]
  before_action :set_group, only: %i[ index show new edit update create destroy]
  before_action :set_book, only: %i[ index show new edit update create destroy]

  # GET /q_pages or /q_pages.json
  def index
    @q_pages = QPage.all
  end

  # GET /q_pages/1 or /q_pages/1.json
  def show
    @message = Message.new
    if !@q_page.nil? && !params[:check].nil?
      if @q_page.writer.id == current_user.id
        @q_page.update(check:params[:check]) 
        redirect_to group_book_q_page_path(@group,@book,@q_page)
      end
    end
  end

  # GET /q_pages/new
  def new
    @q_page = QPage.new
  end

  # GET /q_pages/1/edit
  def edit
  end

  # POST /q_pages or /q_pages.json
  def create
    @q_page = QPage.new(q_page_params)

    respond_to do |format|
      if @q_page.save
        format.html { redirect_to group_book_q_page_url(@group,@book,@q_page), notice: "Q page was successfully created." }
        format.json { render :show, status: :created, location: @q_page }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @q_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /q_pages/1 or /q_pages/1.json
  def update
    respond_to do |format|
      if @q_page.update(q_page_params)
        format.html { redirect_to group_book_q_page_url(@group,@book,@q_page), notice: "Q page was successfully updated." }
        format.json { render :show, status: :ok, location: @q_page }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @q_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /q_pages/1 or /q_pages/1.json
  def destroy
    @q_page.destroy

    respond_to do |format|
      format.html { redirect_to group_book_url(@group,@book), notice: "Q page was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
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
    def set_q_page
      @q_page = QPage.find_by(id: params[:id])
      @messages = @q_page.messages
    end

    # Only allow a list of trusted parameters through.
    def q_page_params
      params.require(:q_page).permit(:title, :book_id, :writer_id)
    end
end
