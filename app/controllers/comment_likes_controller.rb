class CommentLikesController < LikesController

  private

  def find_target
    Comment.find(params[:id])
  end
end
