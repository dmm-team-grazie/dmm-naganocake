class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all.page(params[:page]).reverse_order.per(10)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
    @price = @item.taxed_price
    @cart_items = CartItem.new
  end

  def create
    @item = Item.new(item_params)
  	if @item.save
  		redirect_to admin_items_path, notice: "商品の作成に成功しました!"#保存された場合の移動先を指定。
  	else
  		render :new
  	end
  end

  def update
    @item = Item.find(params[:id])
  	if @item.update(item_params)
  		redirect_to admin_items_path, notice: "商品の更新に成功しました!"
  	else
  		render :edit
  	end
  end

  private

  def  item_params
  	params.require(:item).permit(:genre_id,:name,:non_taxed_price,:introduction,:item_image,:is_valid)
  end

end
