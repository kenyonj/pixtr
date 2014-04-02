class CreateTagMemberships < ActiveRecord::Migration
  def change
    create_table :tag_memberships do |t|
      t.belongs_to :image, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
