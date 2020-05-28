class Address < ApplicationRecord

  validates :address, presence: true
  validates :address_name, presence: true
  validates :postal_code, presence: true

    # ユーザーアドレス情報並べて表示
  def address_info
    self.postal_code + self.address + self.address_name
  end
end
