class MessagesController < ApplicationController
  def create
    from = current_user
    to = Item.find(params[:item_id]).user
    subject = I18n.t :message_from_for, username: from.username, itemname: Item.find(params[:item_id]).title
    body = params[:text]
    from.send_message(to, body, subject)

    respond_to do |format|
      format.js
    end
  end
end
