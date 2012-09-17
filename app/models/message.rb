class Message 
  attr_accessor :from, :item, :subject, :body
  def initialize(details)
    @from = details[:from]
    @item = Item.find(details[:item])
    @body = details[:body] 
    @subject = "test"
  end 

  def save
    @from.send_message(@item.user, @body, @subject)
  end
end
