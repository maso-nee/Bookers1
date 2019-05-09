class BooksController < ApplicationController
  def show
  	@book = Book.find(params[:id])
  end

  def index
  	@book = Book.new
  	@books =Book.all
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	if book.update(book_params)
  	   flash[:notice] = "successfully edited."
  	   redirect_to book_path(book.id)
  	else
       render action: :index
    end
  end


  def create
  	@book = Book.new(book_params)
  	if @book.save
       flash[:notice] = "successfully posted."
       redirect_to book_path(@book.id)
    else
       render action: :index
    end
  end

  def destroy
  	book = Book.find(params[:id])
  	if book.destroy
  	   flash[:notice] = "successfully destroyed."
  	   redirect_to books_path
  	end
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
