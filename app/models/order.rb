class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :member

  enum order_status:{
    waiting: 0,
    checking: 1,
    making: 2, 
    before_deli: 3,
    delivered: 4
  }
  # ユーザーアドレス情報並べて表示
  def address_info
    self.postal_code + self.address + self.first_name + self.last_name
  end


  def total_price_from_cartitem
    self.each do |cart_item|
      item = cart_item.item
      @subtotal_price += item.price * cart_item.number
      @total_price = @subtotal_price
    end
  end

  def total_price_from_order
    self.each do |order|
      item = order.order_detail.item
      @subtotal_price += item.price * order.ordet_detail.number
      @total_price = @subtotal_price
    end
  end
end
