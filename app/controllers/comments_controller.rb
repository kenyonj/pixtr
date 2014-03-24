class CommentsController < ApplicationController
  before_action :authorize

  def create
    image = find_image
    comment = image.comments.create(comment_params)
    if comment.valid?
      process_activity comment
      redirect_to image, alert: "Comment saved!"
    else
      redirect_to image, alert: "Can not comment with an empty comment."
    end
  end

  private

  def find_image
    Image.find(params[:image_id])
  end

  def comment_params
    params.
      require(:comment).
      permit(:body).
      merge(user_id: current_user.id)
  end
end
