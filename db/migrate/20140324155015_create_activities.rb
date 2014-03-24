class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :user, index: true
      t.string :type
      t.belongs_to :subject, polymorphic: true, index: true

      t.timestamps
    end
  end
end
