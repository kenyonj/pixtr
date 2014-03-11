class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = find_gallery
  end

  def new
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.create(gallery_params)
    redirect_to gallery
  end

  def edit
    @gallery = find_gallery
  end

  def update
    gallery = find_gallery
    gallery.update(gallery_params)
    redirect_to gallery
  end

  def destroy
    gallery = find_gallery
    gallery.destroy
    redirect_to galleries_path
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end

  def find_image
    Image.find(params[:id])
  end

  def find_gallery
    Gallery.find(params[:id])
  end
end
