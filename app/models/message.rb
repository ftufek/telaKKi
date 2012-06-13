class Message < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  belongs_to :item

  attr_accessible :text, :from_id, :to_id, :read
end
