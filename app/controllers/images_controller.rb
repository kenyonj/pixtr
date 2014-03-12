class ImagesController < ApplicationController
  def new
    @gallery = find_gallery
    @image = Image.new
  end

  def show
    @image = find_image
  end

  def create
    gallery = find_gallery
    gallery.images.create(image_params)
    redirect_to gallery
  end

  def edit
    @image = find_image
  end

  def update
    image = find_image
    image.update(image_params)
    redirect_to image
  end

  def destroy
    image = find_image
    image.destroy
    redirect_to image.gallery
  end

  private

  def image_params
    params.require(:image).permit(
      :name,
      :url,
      :description
    )
  end

  def find_image
    Image.find(params[:id])
  end

  def find_gallery
    Gallery.find(params[:gallery_id])
  end
end
