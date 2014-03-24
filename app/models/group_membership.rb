class GroupMembership < ActiveRecord::Base
  belongs_to :member,
    class_name: "User"

  belongs_to :group

  has_many :activities, as: :subject, dependent: :destroy

  validates :member_id,
    uniqueness: { scope: :group_id }

end
