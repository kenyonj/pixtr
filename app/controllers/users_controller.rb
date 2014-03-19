class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = find_user
    @images = @user.images
  end

  private

  def find_user
    User.find(params[:id])
  end
end
