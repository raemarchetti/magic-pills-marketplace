class RenameCartItemsToOrderItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :cart_items, :order_items
  end
end
