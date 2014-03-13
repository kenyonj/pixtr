class AddUserToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :user_id, :integer, index: true
  end
end
