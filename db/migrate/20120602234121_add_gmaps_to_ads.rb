class AddGmapsToAds < ActiveRecord::Migration
  def change
    change_table :ads do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
    end
  end
end
