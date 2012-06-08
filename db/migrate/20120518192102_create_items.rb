class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.integer :price, precision: 9, scale:2
      t.integer :up_votes, default: 0
      t.integer :down_votes, default: 0
      t.string :address
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
