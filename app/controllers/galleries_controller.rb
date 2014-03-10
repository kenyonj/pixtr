class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.create(gallery_params)
    redirect_to "/galleries/#{gallery.id}"
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id])
    gallery.update(gallery_params)
    redirect_to "/galleries/#{gallery.id}"
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/"
  end

  private

  def gallery_params
    params.require(:gallery).permit(:name)
  end
end
