class DropCarts < ActiveRecord::Migration[7.0]
  def change
    remove_column :carts, :user_id, foreign_key: true
    remove_column :carts, :product_id, foreign_key: true
    drop_table :carts
  end
end
