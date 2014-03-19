class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments

  has_many :group_images
  has_many :groups, through: :group_images

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true

  def user
    gallery.user
  end
end
