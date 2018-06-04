class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create, :user_params] 

  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
