class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum production_status:{
    none: 0,
    waiting: 1,
    ontheway: 2,
    complete: 3
  }



end
