class BooksController < ApplicationController
  def home
    @books = Book.all
    5.times do
      @books.sample
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    if @book.save(strong_books_params)
      redirect_to @book_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.save(strong_books_params)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to @books_path
  end

  private

  def strong_books_params
    params.require(:books).permit(:book_title, :isbn_number, :book_price, :location, :author)
  end
end
