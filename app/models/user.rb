class User < ActiveRecord::Base
  include Clearance::User

  has_many :galleries

  has_many :images, through: :galleries
  has_many :comments

  has_many :group_memberships, foreign_key: :member_id
  has_many :groups, through: :group_memberships
end
