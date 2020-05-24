class Public::HomesController < ApplicationController

  def top
    @items = Item.where(is_valid: true).page(params[:page]).reverse_order.per(8)
    @genres = Genre.where(is_valid: true)
  end

end
