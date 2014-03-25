class AddLikeableToLikes < ActiveRecord::Migration
  def change
    rename_column :likes, :image_id, :likeable_id
    add_column :likes, :likeable_type, :string

    remove_index :likes, :likeable_id
    add_index :likes, [:likeable_id, :likeable_type]

    update "UPDATE likes SET likeable_type = 'Image'"
  end
end
