class ChangeColumnTypeInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :status, :string
  end
end
