class Category < ActiveRecord::Base
  extend FriendlyId

  has_many :items
  acts_as_nested_set

  attr_accessible :name, :parent_id
  friendly_id :name, use: :slugged
end
