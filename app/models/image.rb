class Image < ActiveRecord::Base
  include Likeable

  belongs_to :gallery
  has_many :comments, dependent: :destroy

  has_many :group_images, dependent: :destroy
  has_many :groups, through: :group_images

  has_many :tag_memberships, dependent: :destroy
  has_many :tags, through: :tag_memberships

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true

  def user
    gallery.user
  end

  def self.search(query)
    tags = Tag.search(query)
    image_ids = TagMembership.where(tag_id: tags).pluck(:image_id)
    where("name ILIKE :query OR description ILIKE :query OR id IN (:image_ids)", query: "%#{query}%", image_ids: image_ids)
  end

end
