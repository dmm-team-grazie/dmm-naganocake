class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order.per(6)
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
    # 注文ステータス
      @order = Order.find(params[:id])

      if defined? order_params[:order_status]
        if @order.order_status != order_params[:order_status]
          @order.update(order_status: order_params[:order_status])
          if @order.order_status == "checking"
            @order.order_details.each do |order_detail|
              order_detail.update(production_status: 1)
            end
          end
        end
      end

      if defined? order_detail_params[:production_status] # 入力されたレコードがあるか
        order_detail = OrderDetail.find(params[:order_detail_id])
        if order_detail.production_status != order_detail_params[:production_status] # 元のレコードとは違うか
          order_detail.update(production_status: order_detail_params[:production_status])
          if order_detail.production_status == "doing" # 更新後のレコードが製作中なら注文も製作中
            @order.update(order_status: 2)
          end
        end
      end


      if @order.order_status == "delivered" && @order.order_details.count == @order.order_details.where( production_status: 3).count
        @order.update(order_status: 4)
      elsif @order.order_details.count == @order.order_details.where( production_status: 3).count
        @order.update(order_status: 3)
      end

      redirect_to admin_order_path(@order)
  end


  def member
    @member = Member.find(params[:id])
    @orders = @member.orders.page(params[:page]).reverse_order.per(10)
  end

  def today
    @orders = Order.where(created_at: Time.zone.now.all_day).page(params[:page]).reverse_order.per(10)
  end

private

  def order_params
    params.require(:order).permit(:order_status)
  end
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
