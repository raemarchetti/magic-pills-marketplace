class RemoveOrderItem < ActiveRecord::Migration[7.0]
  def change
    drop_table :order_items
  end
end
