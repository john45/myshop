class OrdersController < ApplicationController
  def new
    @order = Order.new
    @category = Category.all
  end
end
