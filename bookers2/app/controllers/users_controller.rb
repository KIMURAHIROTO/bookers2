class UsersController < ApplicationController
  before_action :checkuser, only: [:edit]
 
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all

  end

  def edit
    @user = User.find(params[:id])
    if params[:id] == current_user.id
      redirect_to books_path
    else
      render :show
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to user_path(@user.id)
    else
       render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def checkuser
    if params[:id].to_i != current_user.id
      redirect_to user_path(current_user.id)
    end
  end
end
