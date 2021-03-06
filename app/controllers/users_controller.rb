class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:show, :edit, :update]
  def index
    @users = User.search(params[:search])
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	  redirect_to user_path(@user.id)
  	else
  	  render "edit"
  	end
  end

  def confirm
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end

end
