class LikesController < ApplicationController
  def create
    @target = find_target
    like = current_user.like @target
    process_activity like
    render :like
  end

  def destroy
    @target = find_target
    current_user.dislike @target
    render :like
  end
end
