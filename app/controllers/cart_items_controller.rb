class CartItemsController < ApplicationController
	def index
		@cart_item = CartItem.all
	end

	def create
	end

	def destroy_all
	end

	def update
	end

	def destroy_each
	end
end
