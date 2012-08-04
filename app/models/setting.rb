class Setting < ActiveRecord::Base
  belongs_to :user

  attr_accessible :city, :item_view, :locale
end
