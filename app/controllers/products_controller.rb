class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search, :destroy]

  def index
    @products = Product.all
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path, notice: 'Your magic pill was successfully created.'
    else
      render :new, status: :unprocessable_entity, notice: 'Failed to create'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
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

  private

  def product_params
    params.require(:product).permit(:name, :category, :price, :effect, :lifespan_days, :side_effects)
  end
end
