class CreateGroupImages < ActiveRecord::Migration
  def change
    create_table :group_images do |t|
      t.belongs_to :image, index: true
      t.belongs_to :group, index: true

      t.timestamps
    end
  end
end
