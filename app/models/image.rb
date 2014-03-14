class Image < ActiveRecord::Base
  belongs_to :gallery
  
  def user
    gallery.user
  end
end
