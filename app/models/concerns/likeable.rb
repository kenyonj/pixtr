require 'active_support/concern'

module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes, as: :likeable, dependent: :destroy
    has_many :user_likes, through: :likes, source: :user
  end

  def num_likes
    likes.count
  end
end
