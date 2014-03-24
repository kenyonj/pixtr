class LikeActivity < Activity

  def image
    subject.image
  end

  def image_name
    image.name
  end

end
