class GalleryLikesController < LikesController

  private

  def find_target
    Gallery.find(params[:id])
  end
end
