class ImageSearcher
  def initialize(query)
    @query = query
  end


  def images
    image_ids = find_tags_with_id
    Image.where("name ILIKE :query OR description ILIKE :query OR id IN (:image_ids)", query: "%#{@query}%", image_ids: image_ids)
  end

  private

  def find_tags_with_id
    tags = Tag.search(@query)
    TagMembership.where(tag_id: tags).pluck(:image_id)
  end
end
