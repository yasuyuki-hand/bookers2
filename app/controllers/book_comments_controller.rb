class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @book_comment = @book.book_comments.new(book_comment_params)
    @book_comment.user_id = current_user.id
    @book_comment.save
      flash[:success] = "Comment was successfully created."
      redirect_to request.referer
  end

  def destroy
    @book = Book.find(params[:book_id])
    book_comment = current_user.book_comments.find_by(id: params[:id], book_id: @book.id)
    book_comment.destroy
    redirect_to request.referer
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end