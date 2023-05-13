class OrdersController < ApplicationController
  def index
    @orders = Order.select(:id, :created_at, :product_id, :user_id).all
  end
end
