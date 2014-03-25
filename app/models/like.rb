class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :likeable, polymorphic: true

  has_many :activities, as: :subject, dependent: :destroy

  validates :user, uniqueness: { scope: :likeable }
end
