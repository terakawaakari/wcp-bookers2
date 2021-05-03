class BooksController < ApplicationController

  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user_id = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      redirect_to book_path(@book), notice:'You have created book successfully.'
   else
      @books = Book.page(params[:page]).reverse_order
      @user_id = current_user
      render :index
   end

  end

  def show
    @user_find = User.find_by(params[:id])
    #@user_find_id = @user_find.id
    @book_find = Book.find(params[:id])
    @user = current_user
    @user_id = current_user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    @user_id = current_user
     unless @book.user == current_user
       redirect_to book_path(current_user)
     end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice:"You have updated book successfully."
    else
      @user_id = current_user
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
