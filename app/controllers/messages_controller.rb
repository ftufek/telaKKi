class MessagesController < InheritedResources::Base
  before_filter :authenticate_user!
  def index
    id = current_user.id
    @messages = Message.where("to_id = ? OR from_id = ?", id, id)#.group("item_id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = Message.new(current_user, params[:message])

    @message = {test: "sad", das: "dsaddd"}

    respond_to do |format|
#      if @message.save
#        format.html { redirect_to @message, notice: 'Message was successfully created.' }
#        format.json { render json: @message, status: :created, location: @message }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @message.errors, status: :unprocessable_entity }
#      end
#        format.html { redirect_to @message, notice: 'Message was successfully created.' }
 #       format.json { render json: @message, status: :created, location: @message }
        format.js { render layout: false }
    end
  end

  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
