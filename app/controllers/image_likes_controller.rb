class ImageLikesController < LikesController

  private

  def find_target
    Image.find(params[:id])
  end
end
