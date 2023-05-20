class OrderItemsController < ApplicationController
  # add show method - check this out
  def show
    @order_items = current_user.order.order_items
  end

  def create
    @product = Product.find(params[:product_id])
    @order = current_user.orders.last

    @order_item = OrderItem.new(product: @product, quantity: 1, order: @order)

    if @order_item.save
      redirect_to order_path(@order), notice: "Product added to cart successfully."
    else
      render :products_path, status: :unprocessable_entity
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
