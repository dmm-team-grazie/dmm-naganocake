class Public::OrdersController < ApplicationController
  def thanks
  end
  def index
    @orders = Order.page(params[:page]).reverse_order.per(5)
  end

  def show 
    @order = Order.find(params[:id])
    @orders = current_member.orders
    # 合計金額
      @subtotal_price = 0
      @orders.total_price_from_order
  end

  def new
    @new_order = Order.new
    @addresses = current_member.address_info
    # Pluck使う？
  end

  def confirm
    @cart_items = current_member.cart_items
    @new_order =Order.new
    # 合計金額
      @subtotal_price = 0
      @cart_items.total_price_from_cartitem
  end
  def create 
    @new_order = Order.new
    if @new_order.save
      redirect_to public_order_thanks_path
    else
      render :back
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:member_id, :address, :address_name, :payment, :payment_method)
  end

end
