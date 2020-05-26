class Admin::OrderDetailsController < ApplicationController
  # def update
  #   # 製作ステータス
  #   @order = Order.find(params[:id])
  #   @order_detail = OrderDetail.find(params[:id])
  #   @order_detail.update(order_detail_params)

  #   # if @order_detail.production_status == :halfway
  #   #   @order.order_status = :making
  #   #   redirect_to admin_order_path
  #   # elsif @order_detail.production_status == :complete
  #   #   @order.order_status = :before_deli
  #   #   redirect_to admin_order_path
  #   # else
  #     redirect_to admin_order_path
  #   # end
  # end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end
