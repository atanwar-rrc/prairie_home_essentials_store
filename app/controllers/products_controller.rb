class ProductsController < ApplicationController
  def index
    # Show all categories for the filter dropdown
    @categories = Category.order(:name)

    # Start with all products
    @products = Product.all

    # If a search term is provided, filter by name (case-insensitive)
    if params[:search].present?
      keyword = params[:search].downcase
      @products = @products.where("LOWER(name) LIKE ?", "%#{keyword}%")
    end

    # If a category_id is provided (i.e. not blank), filter by category
    if params[:category_id].present?
      @products = @products.where(category_id: params[:category_id])
    end

    # Finally, order the results by product name
    @products = @products.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end
end
