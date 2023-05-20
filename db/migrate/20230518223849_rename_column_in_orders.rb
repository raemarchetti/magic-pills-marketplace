class RenameColumnInOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :product_id, :status
  end
end
