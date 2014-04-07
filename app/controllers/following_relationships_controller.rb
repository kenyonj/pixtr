class FollowingRelationshipsController < ApplicationController
  def create
    followed_user = find_followed_user
    follow = current_user.follow followed_user
    process_activity(follow, followed_user)
    redirect_to followed_user
  end

  def destroy
    followed_user = find_followed_user
    current_user.unfollow followed_user
    redirect_to followed_user
  end

  private

  def find_followed_user
    User.find(params[:id])
  end
end
