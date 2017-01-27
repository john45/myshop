class OrdersController < ApplicationController
  def new
    @order = Order.new
    @category = Category.all
  end

  def create
    @category = Category.all
    @order = Order.new(order_params)
    @order.add_order_product_from_cart(current_cart)

    if @order.save
      @order.start!
      Cart.destroy(session[:cart_id]) #or current_cart.id
      session[:cart_id] = nil
      session[:count_of_products] = nil
      OrderMailer.order_email(@order).deliver_later
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
