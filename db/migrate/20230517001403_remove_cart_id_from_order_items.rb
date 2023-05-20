class RemoveCartIdFromOrderItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :cart_id, foreign_key: true
  end
end
