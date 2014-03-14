class ImagesController < ApplicationController
  def new
    @gallery = find_gallery
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
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
    current_user.images.find(params[:id])
  end

  def find_gallery
    current_user.galleries.find(params[:gallery_id])
  end
end
