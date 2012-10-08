class MessagesController < ApplicationController
  def index
    @conversations = current_user.mailbox.conversations

    respond_to do |format|
      format.html
    end
  end

  def show
    conversation = current_user.mailbox.conversations.find(params[:id])
    conversation.mark_as_read(current_user)
    @messages = conversation.receipts_for current_user

    respond_to do |format|
      format.html
    end
  end

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
