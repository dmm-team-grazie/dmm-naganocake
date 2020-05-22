class CartItem < ApplicationRecord

  belongs_to :member
  belongs_to :item

  def taxed_price
    tax = 1.1
    return ((self.non_taxed_price * tax).round(2)).ceil
  end

end
