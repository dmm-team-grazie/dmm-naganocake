class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order.per(5)
  end
  def show
    @order = Order.find(params[:id])
    # 金額計算
      @postage = 800.to_i
      @total_price = 0
      @order.order_details.each do |order_detail|
        subtotal_price = order_detail.item.taxed_price * order_detail.number
        @total_price += subtotal_price
      end
      @payment = @total_price.to_i + @postage
  end
  def update
  end
end
