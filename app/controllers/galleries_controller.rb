class GalleriesController < ApplicationController
  before_action :authorize, except: [:show]

  def index
    @galleries = current_user.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.new(gallery_params)
    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @gallery = find_gallery
  end

  def update
    @gallery = find_gallery
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit
    end
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
    current_user.galleries.find(params[:id])
  end
end
