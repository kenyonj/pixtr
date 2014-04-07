class Group < ActiveRecord::Base
  include Likeable

  has_many :group_memberships, dependent: :destroy

  has_many :members,
    through: :group_memberships

  has_many :group_images, dependent: :destroy

  has_many :images,
    through: :group_images

  validates :name, presence: true
end
