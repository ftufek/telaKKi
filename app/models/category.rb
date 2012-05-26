class Category < ActiveRecord::Base
  acts_as_nested_set
  attr_accessible :icon_name, :name, :parent_id
end
