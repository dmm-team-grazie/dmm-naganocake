class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details
  belongs_to :member



  enum order_status:{
    "入金待ち": 0,
    "入金確認中": 1,
    "製作中": 2, 
    "発送準備中": 3,
    "発送済み": 4
  }

  enum payment_method: {
    card: 0,
    bank: 1
    # "クレジットカード": 0,
    # "銀行振込": 1
  }


end
