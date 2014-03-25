class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :user

  has_many :activites, as: :subject, dependent: :destroy

  validates :name, presence: true
  validates :user, presence: true
end
