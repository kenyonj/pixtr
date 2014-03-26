class ImageLikesController < ApplicationController
  def create
    @image = find_image
    like = current_user.like @image
    process_activity like
    @image_likes = @image.likes.count
  end

  def destroy
    @image = find_image
    current_user.dislike @image
    @image_likes = @image.likes.count
  end

  private

  def find_image
    Image.find(params[:id])
  end
end
