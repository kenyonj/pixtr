class TagMembership < ActiveRecord::Base
  belongs_to :image
  belongs_to :tag

  validates :tag_id,
        uniqueness: { scope: :image_id }

end
