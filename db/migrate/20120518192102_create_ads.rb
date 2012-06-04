class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.integer :price, precision: 9, scale:2
      t.integer :up_votes
      t.integer :down_votes
      t.string :address

      t.timestamps
    end
  end
end
