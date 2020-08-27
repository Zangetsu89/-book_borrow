class BooksController < ApplicationController
  def home
    @books = Book.all
    @three_books = @books.sample(3)
  end

  def index
    if params[:search]
     @books = Book.search_by_book_title_and_author(params[:search][:query])
    else
     @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    @marker =  [{
        lat: @book.latitude,
        lng: @book.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { book: @book }),
      }]
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(strong_books_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path
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
    params.require(:book).permit(:book_title, :isbn_number, :book_price, :location, :author, :condition, :description)
  end
end
