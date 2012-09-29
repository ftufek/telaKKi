class Category < ActiveRecord::Base
  has_many :items
  acts_as_nested_set

  attr_accessible :icon_name, :name, :parent_id, :image_name
end
