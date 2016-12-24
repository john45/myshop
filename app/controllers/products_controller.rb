class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def add_to_cart

  end
end
