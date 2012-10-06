module MessagesHelper
  def is_unread_messages_for(conversation)
    # TO FIX: make this more efficient

    receipts = conversation.receipts_for current_user

    receipts.each do |r|
      return true if r.is_unread?
    end

    return false
  end
end
