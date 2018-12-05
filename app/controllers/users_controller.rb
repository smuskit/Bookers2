class UsersController < ApplicationController

  def index
  	@users = User.all
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
  	user = User.find(params[:id])
  	user.update(user_params)
  	redirect_to user_path(user)
  end

  def user_params
	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
