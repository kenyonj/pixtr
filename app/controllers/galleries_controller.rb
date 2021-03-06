class GalleriesController < ApplicationController
  respond_to :html, :js
  before_action :authorize, except: [:show]

  def index
    @galleries = current_user.galleries
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images.includes(gallery: [:user])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = current_user.galleries.create(gallery_params)
    process_activity(@gallery, @gallery)
    respond_with @gallery
  end

  def edit
    @gallery = find_gallery
  end

  def update
    @gallery = find_gallery
    @gallery.update(gallery_params)
    respond_with @gallery
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

  def find_gallery
    current_user.galleries.find(params[:id])
  end
end
