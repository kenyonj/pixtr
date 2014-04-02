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
    if query.blank?
      scoped
    else
      q = "%#{query.downcase.strip}%"
      where("lower (name) LIKE ? or lower (description) LIKE ?", q, q)
    end
  end
end
