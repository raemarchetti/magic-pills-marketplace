class OrderItemsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @order_item = OrderItem.new(product: @product, quantity: 1)
    # @orders = current_user.orders
    if @order_item.save
      redirect_to order_path, notice: "Product added to cart successfully."
    else
      render :new
    end
  end

  def update
    @order_item = OrderItem.find(params[:product_id])
    if @order_item.update(quantity: params[:quantity])
      redirect_to order_path, notice: "Cart updated successfully."
    else
      redirect_to order_path, alert: "Product not found in cart."
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:product_id])
    if @order_item.destroy
      redirect_to order_path, notice: "Product removed from cart successfully."
    else
      redirect_to order_path, alert: "Product not found in cart."
    end
  end
end
