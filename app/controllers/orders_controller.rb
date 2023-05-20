class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user: current_user)
    @orders = current_user.orders
  end

  def show

    @order = Order.find(params[:id])

  end

  def create
    @product = Product.find(params[:product_id])
    @order = Order.new
    @order.product = @product
    @order.user = current_user
    @order.save!

    redirect_to order_path(@order)
  end


  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path, notice: 'Order deleted successfully.'
  end

 private

  def order_params
    params.require(:order).permit(:status)
  end
end
