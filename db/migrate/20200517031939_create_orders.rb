class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer "member_id",     null: false
      t.integer "postage",       null: false
      t.integer "payment",       null: false
      t.integer "payment_method",null: false
      t.string "postal_code",    null: false
      t.string "address",        null: false
      t.string "address_name",   null: false
      t.integer "order_status",  null: false
      t.timestamps
    end
    add_index :orders, :id
  end
end
