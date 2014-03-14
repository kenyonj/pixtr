class User < ActiveRecord::Base
  include Clearance::User
  has_many :galleries
  has_many :images, through: :galleries
end
