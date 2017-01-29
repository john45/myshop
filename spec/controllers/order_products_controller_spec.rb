require 'rails_helper'

RSpec.describe OrderProductsController, type: :controller do
  context "work with cart in session" do
    it 'have increase products in cart' do
      count_of_products_in_cart = session[:count_of_products]
      cart = Cart.create
      # order_products = OrderProduct.create(product_id: 1, quantity: 1, cart_id: 2)
      post "/add_same_to_cart"
      expect(count_of_products_in_cart).to eq(session[:count_of_products].to_i + 1)
    end
  end
end
