class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def show
    @product = Product.find(params[:id])
    # @order_item = Order_item.new
  end

  def search
      if params[:search].present?
        @products = Product.where(
          [
            "name LIKE ? OR effect LIKE ? OR side_effects LIKE ?",
            "%#{params[:search]}%",
            "%#{params[:search]}%",
            "%#{params[:search]}%"
          ]
        )
      else
        @products = Product.all
      end

    if params[:category].present?
      @products = @products.where(category: params[:category])
    end

    if params[:sort] == 'asc'
      @products = @products.order(price: :asc)
    elsif params[:sort] == 'desc'
      @products = @products.order(price: :desc)
    end
  end
end
