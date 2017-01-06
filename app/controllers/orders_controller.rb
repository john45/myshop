class OrdersController < ApplicationController
  def new
    @order = Order.new
    @category = Category.all
  end
    
  def create
    @order = Order.new(order_params)
    @order.add_order_product_from_cart(current_cart)
    
    if @order.save
      Cart.destroy(session[:cart_id]) #or current_cart.id
      session[:cart_id] = nil
      redirect_to root_url, notice: 'Thank you for your order'
    else
      @cart = current_cart
      render :new
    end
  end
  
  private
    def order_params
      params.require(:order).permit(:name, :phone, :email, :status)
    end
end
