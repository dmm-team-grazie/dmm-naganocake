class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).reverse_order.per(5)
  end
  def show
    # @order = Order.find(params[:id])
    @orders = Order.all
    # @items = Order.items.all
  end
  def update
  end
end
