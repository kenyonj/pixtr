class User < ActiveRecord::Base
  include Clearance::User

  has_many :activities

  has_many :galleries, dependent: :destroy

  has_many :images,
    through: :galleries,
    dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy

  has_many :liked_images,
    through: :likes,
    source: :likeable,
    source_type: "Image"

  has_many :liked_images,
    through: :likes,
    source: :likeable,
    source_type: "Image"

  has_many :group_memberships,
    foreign_key: :member_id,
    dependent: :destroy

  has_many :groups,
    through: :group_memberships

  has_many :followed_user_relationships,
    foreign_key: :follower_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followed_users,
    through: :followed_user_relationships

  has_many :follower_relationships,
    foreign_key: :followed_user_id,
    class_name: "FollowingRelationship",
    dependent: :destroy

  has_many :followers,
    through: :follower_relationships

  def like(subject)
    likes.create(likeable: subject)
  end

  def dislike(subject)
    like = likes.find_by(likeable: subject)
    likes.destroy like
  end

  def likes?(subject)
    likes.exists?(likeable: subject)
  end

  def is_following?(user)
    followed_user_ids.include? user.id
  end

  def is_member?(group)
    group_ids.include? group.id
  end

  def follow(user)
    followed_user_relationships.create(
      followed_user: user
    )
  end

  def unfollow(user)
    followed_users.destroy user
  end

  def join(group)
    group_memberships.create(group: group)
  end

  def leave(group)
    groups.destroy group
  end
end
