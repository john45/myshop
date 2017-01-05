class OrderProductsController < ApplicationController
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @order_product = @cart.add_product(product.id)

    if @order_product.save
      redirect_to @order_product.cart
    else
      render action: 'new'
    end
  end

  def destroy
    item = OrderProduct.find(params[:id])
    if item.destroy
      redirect_to current_cart
    end
  end
end