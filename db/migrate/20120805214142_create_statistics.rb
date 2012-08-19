class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.integer :user_id, null: false
      t.integer :item_id, null: false
      t.string :type, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end
