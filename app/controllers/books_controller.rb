class BooksController < ApplicationController
before_action :authenticate_user!
before_action :ensure_correct_user, {only: [:edit, :update]}
  def index
    @users = User.all
    @book = Book.new
    @books = Book.all
  end
  
  def new
    @book = Book.new
  end
  
  def create
    # @user = User.new(user_params)
    # if @user.save
    #   redirect_to user_path(@user.id)
    # else
    #   render 'edit'
    # end
    
    @book = current_user.books.build(book_params)
    if @book.save
       redirect_to book_path(@book), notice: "You have created book successfully"
    else
      @books = Book.all
      render 'index'
    end
  end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
    # @book_new = Book.new
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
       redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render 'edit'
    end
  end
  
  def destroy
    current_user.books.find(params[:id]).destroy
    redirect_to books_path
  end
  
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def ensure_correct_user
    book = Book.find(params[:id])
    if current_user.id != book.user.id
      redirect_to books_path
    end
  end
end
