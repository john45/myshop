class CartsController < ApplicationController
  def show
    @cart = current_cart
    @category = Category.all
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    session[:count_of_products] = nil
    redirect_to root_url, notice: 'Cart is empty'
  end
end
