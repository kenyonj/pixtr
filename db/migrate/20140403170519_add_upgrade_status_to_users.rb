class AddUpgradeStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :stripe_customer_number, :string
    add_column :users, :upgrade_status, :boolean, default: false
  end
end
