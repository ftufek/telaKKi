class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show ] 
  before_filter :is_current_user_owner, only: [ :edit, :update, :destroy ]
  # TODO: replace the is_current_user_owner before filter with
  #   @item = current_user.items.find(...)

  def index
    @items = Item.order("created_at DESC").all

    respond_to do |format|
      format.html # index.html.erb
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
    3.times { @item.images.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(params[:item])

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
    @item = Item.find(params[:id])

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
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

private
  def is_current_user_owner
    unless current_user.id == Item.find(params[:id]).user.id
      flash[:error] = "You're not the owner of this item!"
      redirect_to items_path
    end
  end
end
