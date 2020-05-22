class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :users, through: :cart_items

  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  belongs_to :genre

  attachment :item_image, destroy: false

end
