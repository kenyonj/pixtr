class CommentsController < ApplicationController
  before_action :authorize
  respond_to :html, :js

  def create
    image = find_image
    @comment = image.comments.create(comment_params)
    process_activity(@comment, image)
    respond_with @comment
  end

  def destroy
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
