class ProductsController < ApplicationController
  HERO_SATISFACTION = "4.9 / 5".freeze

  def index
    @categories = Category.order(:name)

    @products = Product.includes(:categories)
    if params[:search].present?
      keyword = params[:search].downcase
      @products = @products.where("LOWER(products.name) LIKE ?", "%#{keyword}%")
    end
    if params[:category_id].present?
      @products = @products.joins(:categories).where(categories: { id: params[:category_id] })
    end
    @products = @products.distinct.order(:name)

    @featured_product = @products.first || Product.includes(:categories).first
    @highlight_categories = @categories.limit(4)
    @hero_stats = {
      products: Product.count,
      categories: Category.count,
      satisfaction: HERO_SATISFACTION
    }

    @service_highlights = [
      { title: "Prairie-proof quality", body: "Curated materials that stand up to shifting seasons, from dry winters to humid summers." },
      { title: "Measured delivery", body: "Scheduled drop-offs and packaging removal so setup is calm and clutter-free." },
      { title: "Room pairing help", body: "Message our merch team for complimentary styling notes before you checkout." }
    ]

    @testimonials = [
      { quote: "Every room in our farmhouse feels intentional now. Delivery was spotless and the styling notes were gold.", name: "Amelia - Regina, SK" },
      { quote: "Their layered textiles finally solved our chilly basement lounge. Everything arrived photo-ready.", name: "Jordan - Brandon, MB" }
    ]

    @low_stock_products = Product.includes(:categories).where("stock > 0").order(stock: :asc).limit(3)
  end

  def show
    @product = Product.includes(:categories).find(params[:id])
  end
end
