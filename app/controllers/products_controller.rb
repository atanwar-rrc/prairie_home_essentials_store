class ProductsController < ApplicationController
  def index
    @categories = Category.order(:name)

    @products = Product.includes(:categories)
    if params[:search].present?
      keyword = params[:search].downcase
      @products = @products.where("LOWER(name) LIKE ?", "%#{keyword}%")
    end
    if params[:category_id].present?
      @products = @products.joins(:categories).where(categories: { id: params[:category_id] })
    end
    @products = @products.order(:name)

    @featured_product = @products.first || Product.includes(:categories).first
    @highlight_categories = @categories.limit(3)
    @hero_stats = {
      products: Product.count,
      categories: Category.count,
      satisfaction: "4.9 / 5"
    }
  end

  def show
    @product = Product.includes(:categories).find(params[:id])
  end
end