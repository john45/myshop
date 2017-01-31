require 'rails_helper'

RSpec.describe OrderProductsController, type: :controller do
  context "work with cart in session" do
    it 'have increase products in cart' do
      count_of_products_in_cart = session[:count_of_products]
      # order_products = OrderProduct.create(product_id: 1, quantity: 1, cart_id: 2)
      post "add_same_to_cart"
      expect(count_of_products_in_cart).to eq(session[:count_of_products].to_i + 1)
      # Started POST "/order_products/53/add_same_to_cart" for 127.0.0.1 at 2017-01-31 22:00:51 +0200
      # Processing by OrderProductsController#add_same_to_cart as JS
      # Parameters: {"id"=>"53"}
    end
  end
end
