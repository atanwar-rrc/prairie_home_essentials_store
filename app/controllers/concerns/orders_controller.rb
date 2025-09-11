# app/controllers/orders_controller.rb

class OrdersController < ApplicationController
  def new
    @cart  = session[:cart] || {}
    @items = Product.find(@cart.keys)
  end

  def create
    # In a full implementation you would save an Order here.
    session[:cart] = {}
    flash[:notice] = "Thank you for your purchase!"
    redirect_to products_path
  end
end
