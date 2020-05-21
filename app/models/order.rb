class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy

  belongs_to :member


  enum order_status:{
    waiting: 0,
    checking: 1,
    making: 2,
    before_deli: 3,
    delivered: 4
  }

  def subtotal_price
    self.price * self.number
  end

  def total_price
    self.all.set(:price * :number)
  end

end
