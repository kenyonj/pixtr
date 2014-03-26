class CommentsController < ApplicationController
  before_action :authorize

  def create
    image = find_image
    @comment = image.comments.create(comment_params)
    if @comment.valid?
      process_activity @comment
    else
      redirect_to image, alert: "Can not comment with an empty comment."
    end
  end

  def destroy
    image = find_image
    @comment = find_comment
    current_user.comments.destroy(@comment)
  end

  private

  def find_comment
    Comment.find(params[:id])
  end

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
