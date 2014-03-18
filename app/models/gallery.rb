class Gallery < ActiveRecord::Base
  has_many :images
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true
end
