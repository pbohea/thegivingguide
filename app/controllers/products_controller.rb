class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @experiences = @product.experiences.order(created_at: :desc)
  end
end
