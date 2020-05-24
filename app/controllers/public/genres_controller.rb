class Public::GenresController < ApplicationController

def show
  @genres = Genre.all
  @genre = Genre.find(params[:id])
  @items = @genre.items.page(params[:page]).reverse_order.per(8)
end

end
