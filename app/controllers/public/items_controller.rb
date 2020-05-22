class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order.per(8)
    @genres = Genre.all
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @price = @item.taxed_price
  end

end
