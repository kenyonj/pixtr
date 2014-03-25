class GalleryLikesController < ApplicationController
  def create
    gallery = find_gallery
    like = current_user.like gallery
    process_activity like
    redirect_to gallery
  end

  def destroy
    gallery = find_gallery
    current_user.dislike gallery
    redirect_to gallery
  end

  private

  def find_gallery
    Gallery.find(params[:id])
  end
end
