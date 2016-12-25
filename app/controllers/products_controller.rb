class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def add_to_cart
    product_id = params[:id]
    if cookies[:cart].present?
      product = cookies[:cart].split(',')
      product << product_id
      cookies[:cart] = product.join(',')
    else
      cookies[:cart] = product_id
    end

    redirect_to :back
  end
end
