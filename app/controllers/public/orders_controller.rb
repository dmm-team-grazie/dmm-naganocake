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
    @order = Order.new
    @address_name = current_member.last_name + current_member.first_name
    @addresses = current_member.address_info
    # @addresses = current_member.address
    # Pluck使う？
  end

  def confirm
    @order = Order.new
    @cart_items = current_member.cart_items
    # 合計金額
      @subtotal_price = 0
      @cart_items.total_price_from_cartitem
      @cart_items.each do |cart_item|
      item = cart_item.item
      @subtotal_price += item.price * cart_item.number
      @total_price = @subtotal_price
    end
  end
  def create 
    @order = Order.new
    if @order.save
      redirect_to public_order_thanks_path
    else
      render :new
    end
  end
  
  private

  def order_params
    params.require(:order).permit(:member_id, :address, :address_name, :payment, :payment_method)
  end

end
