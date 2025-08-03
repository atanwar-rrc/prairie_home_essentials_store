class Product < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  # Validations
  validates :name, :description, :price, :stock, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
