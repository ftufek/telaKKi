class Statistic < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  attr_accessible :item, :user, :type
end
