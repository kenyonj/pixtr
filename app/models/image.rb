class Image < ActiveRecord::Base
  belongs_to :gallery
  has_many :comments
  
  def user
    gallery.user
  end
end
