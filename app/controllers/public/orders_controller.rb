class Public::OrdersController < ApplicationController
  def thanks 
  end
  def new
    # @neworder = Order.new
  end
  def index
    @orders = Order.all 
  end
  def show 
    @order = Order.find(params[:id])
    @items = Order.items.all
  end
  def input
    # @neworder = Order.new
  end
  def confirm 
    @order = Order.new(order_params)
    render :new if @order.invalid?
  end
  

end
