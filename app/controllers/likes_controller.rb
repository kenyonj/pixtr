class LikesController < ApplicationController
  def create
    @target = find_target
    like = current_user.like @target
    if like.valid?
      process_activity(like, @target)
    end
    render :like
  end

  def destroy
    @target = find_target
    current_user.dislike @target
    render :like
  end
end
