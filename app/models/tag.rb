class Tag < ActiveRecord::Base

  has_many :tag_memberships, dependent: :destroy
  has_many :images, through: :tag_memberships

  validates :body, presence: true, uniqueness: true

end
