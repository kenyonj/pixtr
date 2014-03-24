class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  has_many :activities, as: :subject, dependent: :destroy

  validates :image, uniqueness: { scope: :user }
end
