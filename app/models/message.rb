class Message < ActiveRecord::Base
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  belongs_to :item

  attr_accessible :text, :from_id, :to_id, :item_id, :read

  validates :text, presence: true, length: { minimum: 5 }
  validates :from, presence: true
  validates :to, presence: true
  validates :item, presence: true
end
