class Public::OrdersController < ApplicationController

  before_action :set_addresses, only: [:new, :create, :edit, :update]


  def thanks
  end
  def index
    @orders = Order.page(params[:page]).reverse_order.per(10)
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


  def new
    @address_name = current_member.last_name + current_member.first_name
  end

  def confirm
    @order = Order.new
    # 支払い情報
      if params[:payment_option].to_i == 0
        @order.payment_method = "card"
      else
        @order.payment_method = "bank"
      end
    @cart_items = current_member.cart_items
    @order.member_id = current_member.id

    # 入力情報表示
    # 文字列に変換：paramaterには文字列にくるから比較対象も文字列にする
      if params[:address_option] == 0.to_s
        # memberDBから習得
        # @order.postal_code
        @order.postal_code = current_member.postal_code
        @order.address = current_member.address
        @order.address_name = current_member.last_name + current_member.first_name
      elsif params[:address_option] == 1.to_s
        # addressDBのidを対象にしてkey=:address_collection、value=idを検索の材料にする
        @chosen_address = Address.find_by(id: params[:address_collection])
        @order.postal_code = @chosen_address.postal_code
        @order.address = @chosen_address.address
        @order.address_name = @chosen_address.address_name
      elsif params[:address_option] == 2.to_s
        # 入力ページからのパラメーターの値を習得
        @order.postal_code = params[:new_postal_code]
        @order.address = params[:new_address]
        @order.address_name = params[:new_address_name]
      end

    # 金額計算
      @postage = 800.to_i
      @total_price = 0
      @cart_items.each do |cart_item|
        subtotal_price = cart_item.item.taxed_price * cart_item.number
        @total_price += subtotal_price
      end
      @payment = @total_price.to_i + @postage
  end

  def create
    # オーダー作成
      @order = Order.new(order_params)
      @order.member_id = current_member.id
      @order.save!

      @new_postal_code = params[:postal_code]
      @new_address = params[:address]
      @new_address_name = params[:address_name]
      @address = Address.where(postal_code: @new_postal_code, member_id: current_member, address: @new_address, address_name: @new_address_name)
      if @address.blank?
        @address = Address.new
        @address.postal_code = @new_postal_code
        @address.address = @new_address
        @address.address_name = @new_address_name
        @address.member_id = current_member.id
        @address.save!
      end
    # オーダー詳細作成
      current_member.cart_items.each do |cart_item|
        @order_detail = OrderDetail.new(item_id: cart_item.item.id,
                                        order_id: @order.id , number: cart_item.number,
                                        price: cart_item.item.taxed_price)
        # @order_detail.number = cart_item.number
        # @order_detail.price = cart_item.item.taxed_price
        @order_detail.save!
      end
    current_member.cart_items.delete_all # カート内商品削除。今回は小要素なのでdestroy_allでも可
    redirect_to public_orders_thanks_path
  end


  def member
    @member = current_member
    @orders = @member.orders.page(params[:page]).reverse_order.per(6)
  end




private
  # 配送先指定を反映
  def set_addresses
    @addresses = Address.where(member_id: current_member.id)
  end

  def order_params
    params.require(:order).permit(:postage,  :payment, :payment_method, :postal_code, :address, :address_name)
  end

  def address_params
    params.require(:address).permit(:postal_code,:address,:address_name,:member_id)
  end

  # <%= form_with(model: @order, local: true, url: {action: 'new'}) do |f| %>
  #   <%= f.hidden_field :payment_method %>
  #   <%= f.hidden_field :postal_code %>
  #   <%= f.hidden_field :address %>
  #   <%= f.hidden_field :address_name %>
  #   <%= f.submit '入力画面に戻る', class: "btn btn-primary btn-lg" %>
  # <% end %>


end
