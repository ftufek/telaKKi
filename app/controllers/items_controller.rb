class ItemsController < ApplicationController
  before_filter :authenticate_user!, except: [ :index, :show, :new, :create ] 

  def index
    if params[:filters]
      @items = Item.solr_search do
        fulltext params[:filters][:query]
      end.results
    else
      @items = Item.order_by_latest_items.all
    end

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
    Item.update(@item.id, views: @item.views+1)
    @json = @item.to_gmaps4rails

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  def new
    @item = Item.new
    #5.times { @item.images.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  def edit
    @item = current_user.items.find(params[:id]) 
  end

  def create
    unless user_signed_in?
      #render status: 404 if params[:email].to_s.strip.length == 0
    end
    @item = current_user.items.new(params[:item])

    respond_to do |format|
      if @item.save
        Image.update_images_for_item(@item, params[:images])
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

  def like
    @item = Item.find(params[:item_id])
    like = Statistic.new(item: @item, user: current_user, type: "like")
    respond_to do |format|
      @status = like.save
      format.js
    end
  end
end
