class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [ :my_items, :my_messages, :settings ]

  def my_items
    @items = Item.where(user_id: current_user.id).find(:all, include: :messages)#where(user_id: current_user.id).include(:messages).all   
  end

  def settings
  end

end
