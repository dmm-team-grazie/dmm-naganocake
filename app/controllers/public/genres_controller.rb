class Public::GenresController < ApplicationController

def show
  @genres = Genre.where(is_valid: true)
  @genre = Genre.find(params[:id])
  @items = @genre.items.where(is_valid: true).page(params[:page]).reverse_order.per(8)
end

end
