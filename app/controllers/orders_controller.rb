class OrdersController < ApplicationController
  before_action :set_order_items, only: [:show]

  def index
    @orders = Order.select(:id, :created_at, :product_id, :user_id).all
  end

  def show
    #
  end

  def create

  end

  private

  def set_order_items
    @order = current_user.order
    @set_order_items ||= @order&.order_items
  end

end
