class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price, precision: 9, scale:2
      t.integer :up_votes
      t.integer :down_votes
      t.string :address
      t.integer :user_id

      t.timestamps
    end
  end
end
