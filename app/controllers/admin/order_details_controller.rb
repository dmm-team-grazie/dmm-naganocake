class OrderDetailsController < ApplicationController
  def create
    current_member.cart_items.each 
    current_member.cart_items.delete.all
  end
end
