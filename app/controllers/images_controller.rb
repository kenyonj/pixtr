class ImagesController < ApplicationController
  def new
    @gallery = find_gallery
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @comments = @image.comments.
                  recent.
                  page(params[:page]).
                  per(2).
                  includes(:user)
  end

  def create
    @gallery = find_gallery
    @image = @gallery.images.build(image_params)
    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @image = find_image
    @groups = current_user.groups
  end

  def update
    @image = find_image
    if @image.update(image_params)
      redirect_to @image
    else
      @groups = current_user.groups
      render :edit
    end
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
      :description,
      group_ids: []
    )
  end

  def find_image
    current_user.images.find(params[:id])
  end

  def find_gallery
    current_user.galleries.find(params[:gallery_id])
  end
end
