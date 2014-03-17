class CommentsController < ApplicationController
  before_action :authorize

  def create
    image = find_image
    image.comments.create(comment_params)
    redirect_to image
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
