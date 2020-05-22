class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.all.page(params[:page]).reverse_order.per(5)
  end
  def show
    @order = Order.find(params[:id])
    @order_detail = OrderDetail.find(params[:id])
    @orders = current_member.orders
    # 合計金額
      @subtotal_price = 0
      @orders.total_price_from_order
  end
  def update
  end
end
