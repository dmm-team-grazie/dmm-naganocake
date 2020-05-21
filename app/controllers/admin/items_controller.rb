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
  end

  def create
    @item = Item.new(item_params)
  	if @item.save
  		redirect_to admin_item_path(@item), notice: "successfully created item!"#保存された場合の移動先を指定。
  	else
  		@items = Item.all.page(params[:page]).reverse_order.per(10)
  		render :index
  	end

    def update
    	@item = Item.find(params[:id])
    	if @item.update(item_params)
    		redirect_to admin_item_path(@item), notice: "successfully updated item!"
    	else 
    		render :edit
    	end
    end


  end

  private

  def  item_params
  	params.require(:item).permit(:genre_id,:name,:non_taxed_price,:introduction,:item_image_id,:is_valid)
  end

end
