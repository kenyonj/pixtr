class Gallery < ActiveRecord::Base
  include Likeable

  has_many :images, dependent: :destroy
  belongs_to :user

  has_many :activities, as: :subject, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true
end
