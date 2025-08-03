class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :products, through: :categorizations

  # A category must have a unique, non‑blank name
  validates :name, presence: true, uniqueness: true
end
