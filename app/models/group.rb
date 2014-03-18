class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :members, through: :group_memberships

  validates :name, presence: true
end
