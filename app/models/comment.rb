class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  validates :body, presence: true

  def self.recent
    order(created_at: :desc)
  end
end
