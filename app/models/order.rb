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
end
