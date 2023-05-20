class AddProductToOrder < ActiveRecord::Migration[7.0]
  def change
    Order.destroy_all
    add_reference :orders, :product, null: false, foreign_key: true
  end
end
