module ProductsHelper
  def stock_badge_label(stock)
    return "Low stock" if stock.to_i > 0 && stock.to_i <= 5
    return "Sold out" if stock.to_i <= 0

    "In stock"
  end

  def stock_badge_class(stock)
    return "stock-indicator--low" if stock.to_i > 0 && stock.to_i <= 5
    return "stock-indicator--out" if stock.to_i <= 0

    "stock-indicator--in"
  end
end