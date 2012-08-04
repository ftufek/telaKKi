class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :city
      t.string :locale
      t.boolean :item_view
      t.integer :user_id
      t.timestamps
    end
  end
end
