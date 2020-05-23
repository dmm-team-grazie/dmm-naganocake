class Public::CartItemsController < ApplicationController
	# いらん？
	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.save
		redirect_to public_order_path
	end
	# ここまで

	def index
		@cart_items = CartItem.all
		@cart_item = CartItem.find(params[:id])
		@price = @cart_item.item.taxed_price
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update
		redirect_to public_order_path
	end

	def destroy_all
		@cart_items = CartItem.all
		@cart_items.destroy
		redirect_to public_order_path
	end

	def destroy_each
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy
		redirect_to public_order_path
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:item_id, :member_id, :number)
	end
end
