class ImagesController < ApplicationController
  respond_to :html

  def new
    @gallery = find_gallery
    @image = Image.new
  end

  def show
    @image = Image.find(params[:id])
    @comment = Comment.new
    @tag = Tag.new
    @tags = @image.tags
    @comments = @image.comments.recent.paginated(params[:page], 2).
                  includes(:user)
  end

  def create
    @gallery = find_gallery
    @image = @gallery.images.build(image_params)
    process_activity(@image, @image)
    respond_with @image, location: @gallery
  end

  def edit
    @image = find_image
    @groups = current_user.groups
  end

  def update
    @image = find_image
    @groups = current_user.groups
    respond_with @image
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
