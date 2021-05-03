class UsersController < ApplicationController

  def index
    @users = User.page(params[:page]).reverse_order
    @user_id = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
    @user_id = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @user_id = current_user
    unless @user == current_user
      redirect_to books_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:"You have updated user successfully."
    else
      @user_id = current_user
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
