class DropAdminUsers < ActiveRecord::Migration
  def change
    drop_table :admin_users
    drop_table :active_admin_comments
  end
end
