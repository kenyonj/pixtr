class UsersController < ApplicationController
  before_action :authorize

  def index
    @users = User.all
  end

  def show
    @user = find_user
    @images = @user.images.
                includes(gallery: [:user])
  end

  private

  def find_user
    User.find(params[:id])
  end
end
