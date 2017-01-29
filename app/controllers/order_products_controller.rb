class OrderProductsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @order_product = @cart.add_product(product.id)
    session[:count_of_products] += 1

    if @order_product.save
      render 'order_products/create'
    else
      render action: 'new'
    end
  end

  def add_same_to_cart
    session[:count_of_products] += 1
    @order_product = OrderProduct.find(params[:id])
    @order_product.quantity += 1
    @order_product.save
    @cart = @order_product.cart
  end

  def remove_same_from_cart
    session[:count_of_products] -= 1
    @order_product = OrderProduct.find(params[:id])
    @order_product.quantity -= 1
    @cart = @order_product.cart
    @order_product.save
    if @order_product.quantity.zero?
      @order_product.destroy
      render 'order_products/remove_same_from_cart'
    else
      render 'order_products/add_same_to_cart'
    end
  end

  def destroy
    item = OrderProduct.find(params[:id])
    session[:count_of_products] -= 1
    redirect_to current_cart if item.destroy
  end
end
