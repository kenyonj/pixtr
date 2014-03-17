class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  def user
    image.user
  end
end
