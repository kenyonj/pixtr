class GroupMembership < ActiveRecord::Base
  belongs_to :member,
    class_name: "User"

  belongs_to :group

  validates :member_id,
    uniqueness: { scope: :group_id }

end
