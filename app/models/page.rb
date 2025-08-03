class Page < ApplicationRecord
  validates :slug, :title, :body, presence: true
  validates :slug, uniqueness: true
end
