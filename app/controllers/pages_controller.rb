class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def index
    @products = Product.paginate(page: params[:page], per_page: 10)
  end

  def home

  end

end
