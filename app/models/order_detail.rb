class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum production_status:{
    impossible: 0,
    waiting: 1,
    doing: 2,
    complete: 3
  }


end
