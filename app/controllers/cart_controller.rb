# app/controllers/cart_controller.rb

class CartController < ApplicationController
  def show
    @cart  = session[:cart] || {}
    @items = Product.find(@cart.keys)
  end

  def add
    product_id = params[:id].to_s
    session[:cart] ||= {}
    session[:cart][product_id] = (session[:cart][product_id] || 0) + 1

    flash[:notice] = "Added to cart."
    redirect_to products_path
  end

  def remove
    product_id = params[:id].to_s
    session[:cart]&.delete(product_id)

    flash[:notice] = "Item removed."
    redirect_to cart_path
  end

  def update
    product_id = params[:id].to_s
    quantity   = params[:quantity].to_i
    if quantity > 0
      session[:cart][product_id] = quantity
    else
      session[:cart]&.delete(product_id)
    end

    redirect_to cart_path
  end
end
