# db/seeds_external.rb

require 'httparty'
require 'json'

puts "Importing external products and categories..."

# Replace the URL with your chosen dataset or API.
url = "https://dummyjson.com/products?limit=100"
response = HTTParty.get(url)
products_data = JSON.parse(response.body)["products"]

products_data.each do |p|
  # Create or find the category.
  category = Category.find_or_create_by!(name: p["category"].to_s.titleize)

  # Create the product record.  Set category_id to avoid a null constraint
  # violation on the products table.
  product = Product.create!(
    name:        p["title"],
    description: p["description"],
    price:       p["price"],
    stock:       p["stock"] || 10,
    category_id: category.id
  )

  # Optionally populate the many‑to‑many relationship via categorizations.
  product.categories << category unless product.categories.include?(category)
end

puts "✅ Imported #{products_data.size} products for task 1.8."
