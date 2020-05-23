class Public::CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.item_id = params[:item_id].to_i
		@cart_item.member_id = current_member.id
		@cart_item.save
		redirect_to public_cart_items_path
	end

	def index
		@cart_items = CartItem.all
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to public_cart_items_path
	end

	def destroy_all
		@cart_items = CartItem.all
		@cart_items.destroy(cart_item_params)
		redirect_to public_cart_items_path
	end

	def destroy_each
		@cart_item = CartItem.find(params[:id])
		@cart_item.destroy(cart_item_params)
		redirect_to public_cart_items_path
	end

	private
	def cart_item_params
		params.permit(:item_id,:number)
	end
end
