class UsersController < ApplicationController
  def show
     @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    @book_new = Book.new
  end

  def index
    @book = Book.new
   @users = User.all
    @user = current_user
     @book_new = Book.new
 end


   def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to current_user
  end
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
  unless @user.id == current_user.id
    redirect_to users_path
  end
  @user = User.find(params[:id])
  if @user.update(user_params)
    flash[:notice] = "You have updated user successfully"
  redirect_to user_path(@user.id)
else
  render :edit
end
end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
