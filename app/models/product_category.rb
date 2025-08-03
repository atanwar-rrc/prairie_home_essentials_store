class ProductCategory < ApplicationRecord
  # Join model linking products and categories. Each product may belong to
  # many categories and each category may have many products.
  belongs_to :product
  belongs_to :category
end
