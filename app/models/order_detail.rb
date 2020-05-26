class OrderDetail < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum production_status:{

    # "着手不可": 0,
    # "製作待ち": 1,
    # "製作中": 2,
    # "製作完了": 3

    impossible: 0,
    waiting: 1,
    halfway: 2,
    complete: 3
  }


    
end
