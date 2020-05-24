class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :item

  def taxed_price
    tax = 1.1
    return ((self.non_taxed_price * tax).round(2)).ceil
  end

  def total_price_from_cartitem
    self.each do |cart_item|
      item = cart_item.item
      @subtotal_price += item.price * cart_item.number
      @total_price = @subtotal_price
    end
  end

end
