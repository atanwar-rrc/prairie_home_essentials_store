# app/controllers/products_controller.rb

class ProductsController < ApplicationController
  def index
    @categories = Category.all

    products = Product.includes(:categories)

    # Keyword search by product name (case-insensitive)
    if params[:search].present?
      keyword = params[:search].downcase
      products = products.where("LOWER(name) LIKE ?", "%#{keyword}%")
    end

    # Filter by category if a category_id param is provided
    if params[:category_id].present?
      products = products.joins(:categories)
                         .where(categories: { id: params[:category_id] })
    end

    # You can add pagination here if you wish (e.g. using Kaminari or will_paginate)
    @products = products.order(:name)
  end

  def show
    @product = Product.find(params[:id])
  end
end
