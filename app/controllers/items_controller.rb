class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show, :new ] 

  def index
    @items = Item.order_by_latest_items.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  def for_user
    @items = current_user.items

    respond_to do |format|
      format.html # for_user.html.erb
      format.json { render json: @items }
    end
  end

  def show
    @item = Item.find(params[:id])
    @json = @item.to_gmaps4rails
    @message = Message.new
    @message.item = @item
    @message.to = @item.user
    @message.from = current_user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def new
    @item = Item.new
    5.times { @item.images.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @item = current_user.items.find(params[:id]) 
  end

  def create
    @item = Item.new_from(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @item = current_user.items.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end
end
