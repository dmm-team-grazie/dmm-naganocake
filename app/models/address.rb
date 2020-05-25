class Address < ApplicationRecord
    # ユーザーアドレス情報並べて表示
  def address_info
    self.postal_code + self.address + self.address_name
  end
end
