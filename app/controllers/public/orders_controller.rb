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
      @orders.total_price_frm_order
  end

  def new
    @address_name = current_member.last_name + current_member.first_name
    @addresses = Address.where(member_id: current_member.id)
    # @addresses = current_member.addresses.address_info
    # Pluck使う？
  end

  def confirm
    @order = Order.new
    @order.payment_method = params[:payment_option].to_i
    @cart_items = current_member.cart_items
    @order.member_id = current_member.id

  # 入力情報表示
    if params[:address_option] == 0.to_s
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.address_name = current_member.last_name + current_member.first_name
    elsif params[:address_option] == 1.to_s
      @chosen_address = Address.find_by(id: params[:address_collection])
      @order.postal_code = @chosen_address.postal_code
      @order.address = @chosen_address.address
      @order.address_name = @chosen_address.address_name
    elsif params[:address_option] == 2.to_s
      @order.postal_code = params[:new_postal_code]
      @order.address = params[:new_address]
      @order.address_name = params[:new_address_name]
    end
    # params, collection_select, dbからrecordを持ってくるメソッド

  # 合計金額
    # @subtotal_price = 0
    # @cart_items.total_price_from_cartitem
  end
  def create 
    @order = Order.new
    if @order.save
      redirect_to public_order_thanks_path
    else
      render :new
    end
  end
  

  # def order_params
  #   params.require(:order).permit(:member_id, :address, :address_name, :payment, :payment_method)
  # end

end
