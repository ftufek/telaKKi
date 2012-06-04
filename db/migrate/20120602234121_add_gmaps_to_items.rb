class AddGmapsToItems < ActiveRecord::Migration
  def change
    change_table :items do |t|
      t.float :latitude
      t.float :longitude
      t.boolean :gmaps
    end
  end
end
