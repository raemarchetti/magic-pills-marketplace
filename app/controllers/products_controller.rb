class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :search]

  def index
    if params[:category]
      @category = params[:category]
      @products = Product.where(category: params[:category])
    elsif params[:query]
      @products = Product.search(params[:query])
    elsif params[:user_id]
      @products = Product.where(user_id: params[:user_id])
    else
      @products = Product.all
    end

    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
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
    @products = Product.all

    if params[:search].present?
      search_query = "%#{params[:search]}%"
      @products = @products.where("name LIKE :query OR effect LIKE :query OR side_effects LIKE :query", query: search_query)
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
