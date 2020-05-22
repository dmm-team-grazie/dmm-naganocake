class Public::HomesController < ApplicationController

def top
  @genres = Genre.all
  @items = Item.page(params[:page]).reverse_order.per(4)
end

end
