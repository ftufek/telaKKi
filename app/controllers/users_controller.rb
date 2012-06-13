class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [ :my_items ]

  def my_items
    @items = Item.where(user_id: current_user.id).all   
  end

end
