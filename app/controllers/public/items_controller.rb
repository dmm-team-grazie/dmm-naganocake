class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_valid: true).page(params[:page]).reverse_order.per(8)
    @genres = Genre.where(is_valid: true)
    i = 0
    @items.each  do |item|
      if item.genre.is_valid == true
        i += 1
      end
    end
    @items_count = i
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @price = @item.taxed_price
  end

end
