class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :from_id
      t.integer :to_id
      t.text :text

      t.boolean :read, default: false

      t.timestamps
    end
  end
end
