class TagsController < ApplicationController
  def create
    image = find_image
    @tag = Tag.create(tag_params)
    if @tag.valid?
      image.tag_memberships.create(tag: @tag)
    else
      image.tag_memberships.create(tag: find_tag)
    end
  end

  def show
    @tag = find_tag_from_url
    @images = @tag.images.includes(gallery: [:user])
  end

  private

  def tag_params
    params.require(:tag).
      permit(:body)
  end

  def find_tag_from_url
    Tag.find(params[:id])
  end

  def find_image
    Image.find(params[:image_id])
  end

  def find_tag
    Tag.find_by(body: params[:tag][:body])
  end
end
