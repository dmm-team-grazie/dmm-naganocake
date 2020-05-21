class Public::OrdersController < ApplicationController
  def thanks 
  end
  def new
    # @neworder = Order.new
  end
  def index
    @orders = Order.page(params[:page]).reverse_order.per(5)
  end
  def show 
    # @order = Order.find(params[:id])
    @orders = Order.all
  end
  def input
    # @neworder = Order.new
  end
  def confirm 
    @orders = Order.all
    @order = Order.new(order_params)
    render :new if @order.invalid?
  end
  

end
