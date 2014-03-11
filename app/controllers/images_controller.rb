class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    gallery = Gallery.find(params[:gallery_id])
    gallery.images.create(image_params)
    redirect_to gallery
  end

  private

  def image_params
    params.require(:image).permit(
      :name,
      :url,
      :description
    )
  end
end
