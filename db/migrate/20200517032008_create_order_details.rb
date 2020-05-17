class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer "order_id",           null: false
      t.integer "item_id",            null: false
      t.integer "price",              null: false
      t.integer "number",             null: false
      t.integer "production_status",  null: false
      t.timestamps
    end
    add_index :order_details, :id
  end
end
