class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  validates :image, uniqueness: { scope: :user }
end
