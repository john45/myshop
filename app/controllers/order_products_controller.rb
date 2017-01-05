class OrderProductsController < ApplicationController
  def create
    @cart = current_cart
    
  end
end
