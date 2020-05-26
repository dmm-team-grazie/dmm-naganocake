class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  # 以下が空白の場合、新規登録できない
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_kana_name, presence: true
  validates :last_kana_name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  # 会員ステータスがtrueでないとログインできない
  def active_for_authentication?
    super && (self.is_valid == true)
  end

  # 会員一覧をIDの古い順番で表示
  default_scope -> { order(created_at: :desc) }
end
