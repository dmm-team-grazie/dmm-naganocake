class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :introduction, :text, null: true
    change_column :items, :item_image_id, :text, null: true
  end
end
