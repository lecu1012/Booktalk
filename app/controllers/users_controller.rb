class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def new
    @user = User.new
    render layout: 'login'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to books_index_path
    else
      render 'new'
    end
  end

  def update
    if @user.update_attribute(:image, params[:image])
      redirect_to user_path
    else
      render 'show'
    end

  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confiration)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
