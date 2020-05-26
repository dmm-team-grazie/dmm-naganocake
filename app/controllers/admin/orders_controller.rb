class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).reverse_order.per(2)
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
    
    # if defined? order_detail_params[:production_status]
    #   if order_detail.production_status != order_detail_params[:production_status]
    #     order_detail.update(production_status: order_detail_params[:production_status])
    #     if order_detail.production_status == "halfway"
    #       @order.update(order_status: 2)
    #     end
    #   end
    # end

    # 数と数を合わせる
    # == 
    # update


    redirect_to admin_order_path(@order)
  end



    # @order.update(order_params)
    # @order_detail.update(order_detail_params)

    # redirect_to admin_order_path
    # if @order.order_status == :checking
    #   @order.order_details.production_status = :waiting
    #   redirect_to admin_order_path
    # else
    # end
 

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
