require 'net/http'
require 'json'

# Clear old data
Product.destroy_all
Category.destroy_all

# Create categories
categories = ["Fiction", "Non-fiction", "Mystery", "Science"].map do |name|
  Category.create!(name: name)
end

# Fetch books from API
url = URI("https://fakerapi.it/api/v1/books?_quantity=100")
res = Net::HTTP.get(url)
books = JSON.parse(res)["data"]

# Seed products
books.each_with_index do |book, i|
  Product.create!(
    name: book["title"],
    description: book["description"],
    price: rand(5.0..100.0).round(2),
    stock: rand(10..100),
    image_url: book["image"],
    category_id: categories[i % categories.length].id
  )
end

puts "✅ Seeded 100 products with categories."
