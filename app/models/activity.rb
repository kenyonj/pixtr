class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, polymorphic: true

  def self.recent
    order(created_at: :desc)
  end
end
