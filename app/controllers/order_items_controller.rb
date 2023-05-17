class OrderItemsController < ApplicationController
  def add_to_order
    @product = Product.find(params[:product_id])
    current_user.order.create(product: @product, quantity: 1)
    redirect_to order_path, notice: "Product added to cart successfully."
  end

  def update_order
    @order = current_user.order.find_by(product_id: params[:product_id])
    if @order
      @order.update(quantity: params[:quantity])
      redirect_to order_path, notice: "Cart updated successfully."
    else
      redirect_to order_path, alert: "Product not found in cart."
    end
  end

  def remove_from_order
    @order = current_user.order.find_by(product_id: params[:product_id])
    if @order
      @order.destroy
      redirect_to order_path, notice: "Product removed from cart successfully."
    else
      redirect_to order_path, alert: "Product not found in cart."
    end
  end
end
