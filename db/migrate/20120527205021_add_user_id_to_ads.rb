class AddUserIdToAds < ActiveRecord::Migration
  def change
    change_table :ads do |t|
      t.integer :user_id
    end
  end
end
