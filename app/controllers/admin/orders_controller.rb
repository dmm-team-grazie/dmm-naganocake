class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
  def show
    @order = Order.find(params[:id])
    @items = Order.items.all
  end
  def update
  end
end
