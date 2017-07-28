class BooksController < ApplicationController

  before_action do
    if @current_user.blank?
      redirect_to login_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find_by id: params[:id]
    unless @book.user == @current_user
      redirect_to root_path, notice: "Bad User!"
    end
  end

  def create
    @book = Book.new(book_params)
    @book.user = @current_user
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def update
    @book = Book.find_by id: params[:id]
    unless @article.user == @current_user
      redirect_to root_path, notice: "Bad User!"
    end

    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.url = params[:book][:url]
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def destroy
    Book.destroy params[:id]
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :author, :description, :url)
    end

end
