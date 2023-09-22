class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :logged_in_user
  before_action :set_group, only: %i[ index show]
  before_action :set_admin_group, only: %i[ new edit update create]

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    @group.books << @book
    respond_to do |format|
      if @book.save
        format.html { redirect_to home_path(id: @group.id), notice: "Book was successfully created." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { redirect_to new_book_path(id: @group.id), status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to home_url(id: params[:group_id]), notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find_by(id: params[:group_id])
      if @group.nil?
        redirect_to groups_path
      end
    end

    def set_admin_group
      @group = Group.find_by(id: params[:group_id])
      if @group.nil?
        redirect_to groups_path
      end

      if @group.admin_users.find_by(id: current_user.id).nil?
        redirect_to home_path(id: @group.id,book_id: @book.id)
      end
    end

    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
