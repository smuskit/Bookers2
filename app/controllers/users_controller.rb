class UsersController < ApplicationController

  before_action :authenticate_user!, except: [:new] # users だけ弾く（トップは除外できる）
  before_action :correct_user, only: [:edit, :update]

  def correct_user
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to books_path
      end
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  def show
  	@book = Book.new                 # → users/show
  	@user = User.find(params[:id])
    @books = @user.books            # → users/show
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user_id = current_user.id
    if @user.update(user_params)
       redirect_to user_path(@user)
    else
       render :edit
    end
  end


  def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
