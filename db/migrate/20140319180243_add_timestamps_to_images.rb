class AddTimestampsToImages < ActiveRecord::Migration
  def change
    add_column :images, :created_at, :datetime
    add_column :images, :updated_at, :datetime

    update "UPDATE images SET created_at = NOW(), updated_at = NOW()"
  end
end
