class GroupImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :group
end
