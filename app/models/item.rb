class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  has_many :users, through: :cart_items

  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  belongs_to :genre

  attachment :item_image, destroy: false

  validates :name, presence: true
  validates :non_taxed_price, presence: true
  validates :is_valid, presence: true
  validates :is_valid, presence: true

  def taxed_price
    tax = 1.1
    return ((self.non_taxed_price * tax).round(2)).ceil
  end

end
